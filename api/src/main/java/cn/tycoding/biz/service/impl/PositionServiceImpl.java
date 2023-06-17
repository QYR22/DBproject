package cn.tycoding.biz.service.impl;

import cn.tycoding.biz.entity.Position;
import cn.tycoding.biz.mapper.PositionMapper;
import cn.tycoding.biz.service.PositionService;
import cn.tycoding.biz.service.ProblemPositionService;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PositionServiceImpl extends ServiceImpl<PositionMapper, Position> implements PositionService {

    @Autowired
    private PositionMapper positionMapper;

    @Autowired
    private ProblemPositionService problemPositionService;

    @Override
    public IPage<Position> list(Position position, QueryPage queryPage) {
        IPage<Position> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        LambdaQueryWrapper<Position> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(position.getName()), Position::getName, position.getName());
        queryWrapper.orderByDesc(Position::getId);
        return positionMapper.selectPage(page, queryWrapper);
    }
    @Override
    public IPage<Position> listByUser(Long userId, Position position, QueryPage queryPage){
        IPage<Position> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        LambdaQueryWrapper<Position> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(position.getName()), Position::getName, position.getName());
        /*
        WHERE position_uid = userId
        */
        queryWrapper.eq(Position::getUid, userId);
        queryWrapper.orderByDesc(Position::getId);
        return positionMapper.selectPage(page, queryWrapper);
    }

    @Override
    public List<Position> list(Position position) {
        LambdaQueryWrapper<Position> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(position.getName()), Position::getName, position.getName());
        queryWrapper.orderByDesc(Position::getId);
        return positionMapper.selectList(queryWrapper);
    }
    @Override
    public List<Position> listByUser(Long userId, Position position){
        LambdaQueryWrapper<Position> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(position.getName()), Position::getName, position.getName());
        /*
        WHERE position_uid = userId
        */
        queryWrapper.eq(Position::getUid, userId);
        queryWrapper.orderByDesc(Position::getId);
        return positionMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional
    public void add(Position position) {
        if (!exists(position)) {
            positionMapper.insert(position);
        }
    }

    private boolean exists(Position position) {
        LambdaQueryWrapper<Position> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Position::getName, position.getName());
        return positionMapper.selectList(queryWrapper).size() > 0;
    }

    @Override
    @Transactional
    public void update(Position position) {
        positionMapper.updateById(position);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        //删除该标签与题目有关联的关联信息
        problemPositionService.deleteByPositionsId(id);

        positionMapper.deleteById(id);
    }

    @Override
    public List<Position> findByProblemId(Long id) {
        return positionMapper.findPositionByProblemId(id);
    }

}
