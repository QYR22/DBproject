package cn.tycoding.biz.service.impl;

import cn.tycoding.biz.entity.ProblemOrganization;
import cn.tycoding.biz.mapper.ProblemOrganizationMapper;
import cn.tycoding.biz.service.ProblemOrganizationService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProblemOrganizationServiceImpl extends ServiceImpl<ProblemOrganizationMapper, ProblemOrganization> implements ProblemOrganizationService {

    @Autowired
    private ProblemOrganizationMapper problemOrganizationMapper;


    @Override
    @Transactional
    public void add(ProblemOrganization problemOrganization) {
        //DONE 题目对organization是 NVM的关系！！ like tag
        if (!exists(problemOrganization)) {
            problemOrganizationMapper.insert(problemOrganization);
        }
    }
    //所以不同于category对problem单个判断   这里的exists判断是对 pair(problem,organization)进行的
    private boolean exists(ProblemOrganization problemOrganization) {
        LambdaQueryWrapper<ProblemOrganization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemOrganization::getProblemId, problemOrganization.getProblemId());
//        queryWrapper.eq(ProblemOrganization::getOrganizationId, problemOrganization.getOrganizationId());
        return problemOrganizationMapper.selectList(queryWrapper).size() > 0;
    }

    @Override
    @Transactional
    public void deleteByProblemId(Long id) {
        LambdaQueryWrapper<ProblemOrganization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemOrganization::getProblemId, id);
        problemOrganizationMapper.delete(queryWrapper);
    }

    @Override
    @Transactional
    public void deleteByOrganizationId(Long id) {
        LambdaQueryWrapper<ProblemOrganization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemOrganization::getOrganizationId, id);
        problemOrganizationMapper.delete(queryWrapper);
    }
}
