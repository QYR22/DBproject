package cn.tycoding.biz.service.impl;

import cn.tycoding.biz.entity.Problem;
import cn.tycoding.biz.entity.ProblemCategory;
import cn.tycoding.biz.mapper.ProblemCategoryMapper;
import cn.tycoding.biz.mapper.ProblemCategoryMapper;
import cn.tycoding.biz.service.ProblemCategoryService;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
public class ProblemCategoryServiceImpl extends ServiceImpl<ProblemCategoryMapper, ProblemCategory> implements ProblemCategoryService {

    @Autowired
    private ProblemCategoryMapper problemCategoryMapper;


    @Override
    @Transactional
    public void add(ProblemCategory problemCategory) {
        //DONE 题目对category文件夹是 1V1的关系！！ 只能属于一个文件夹
        if (!exists(problemCategory)) {
            problemCategoryMapper.insert(problemCategory);
        }
    }
    //!其他的organization、position、tag是 N v M 的关系((怎么看着这么颜文字哈哈
    //所以category这里的exists不应该是这样的 直接根据对应的problemId查找即可
    //如果problemId存在于ProblemCategory表中 说明这个problem已经有对应的category了 就不能加了 除非删掉原来的
    //当时脑子热也新建了一个表 来不及改了。。。
    private boolean exists(ProblemCategory problemCategory) {
        LambdaQueryWrapper<ProblemCategory> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemCategory::getProblemId, problemCategory.getProblemId());
        //queryWrapper.eq(ProblemCategory::getCategoryId, problemCategory.getCategoryId());
        return problemCategoryMapper.selectList(queryWrapper).size() > 0;
    }

    @Override
    @Transactional
    public void deleteByProblemId(Long id) {
        LambdaQueryWrapper<ProblemCategory> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemCategory::getProblemId, id);
        problemCategoryMapper.delete(queryWrapper);
    }

    @Override
    @Transactional
    public void deleteByCategoryId(Long id) {
        LambdaQueryWrapper<ProblemCategory> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemCategory::getCategoryId, id);
        problemCategoryMapper.delete(queryWrapper);
    }
}
