package cn.tycoding.biz.service.impl;

import cn.tycoding.biz.entity.ProblemTag;
import cn.tycoding.biz.mapper.ProblemTagMapper;
import cn.tycoding.biz.service.ProblemTagService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class ProblemTagServiceImpl extends ServiceImpl<ProblemTagMapper, ProblemTag> implements ProblemTagService {

    @Autowired
    private ProblemTagMapper problemTagMapper;

    @Override
    @Transactional
    public void add(ProblemTag problemTag) {
        //DONE 题目对tag不是1V1的关系！！！ 但是题目A与tagB之间关系是1V1的 pair(problem,tag)是唯一的
        if (!exists(problemTag)) {
            problemTagMapper.insert(problemTag);
        }
    }

    private boolean exists(ProblemTag problemTag) {
        LambdaQueryWrapper<ProblemTag> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemTag::getProblemId, problemTag.getProblemId());
        queryWrapper.eq(ProblemTag::getTagId, problemTag.getTagId());
        return problemTagMapper.selectList(queryWrapper).size() > 0;
    }

    @Override
    @Transactional
    public void deleteByProblemId(Long id) {
        LambdaQueryWrapper<ProblemTag> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemTag::getProblemId, id);
        problemTagMapper.delete(queryWrapper);
    }

    @Override
    @Transactional
    public void deleteByTagsId(Long id) {
        LambdaQueryWrapper<ProblemTag> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemTag::getTagId, id);
        problemTagMapper.delete(queryWrapper);
    }
}
