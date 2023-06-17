package cn.tycoding.biz.service.impl;


import cn.tycoding.biz.entity.ProblemPosition;
import cn.tycoding.biz.mapper.ProblemPositionMapper;
import cn.tycoding.biz.service.ProblemPositionService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProblemPositionServiceImpl extends ServiceImpl<ProblemPositionMapper,ProblemPosition> implements ProblemPositionService {

    @Autowired
    private ProblemPositionMapper problemPositionMapper;

    @Override
    @Transactional
    public void add(ProblemPosition problemPosition) {
        if (!exists(problemPosition)) {
            problemPositionMapper.insert(problemPosition);
        }
    }
    //pair(problem,position)是唯一的
    private boolean exists(ProblemPosition problemPosition) {
        LambdaQueryWrapper<ProblemPosition> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemPosition::getProblemId, problemPosition.getProblemId());
        queryWrapper.eq(ProblemPosition::getPositionId, problemPosition.getPositionId());
        return problemPositionMapper.selectList(queryWrapper).size() > 0;
    }

    @Override
    @Transactional
    public void deleteByProblemId(Long id) {
        LambdaQueryWrapper<ProblemPosition> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemPosition::getProblemId, id);
        problemPositionMapper.delete(queryWrapper);
    }

    @Override
    @Transactional
    public void deleteByPositionsId(Long id) {
        LambdaQueryWrapper<ProblemPosition> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemPosition::getPositionId, id);
        problemPositionMapper.delete(queryWrapper);
    }
}
