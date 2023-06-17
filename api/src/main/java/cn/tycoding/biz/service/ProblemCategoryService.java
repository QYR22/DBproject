package cn.tycoding.biz.service;

import cn.tycoding.biz.entity.Problem;
import cn.tycoding.biz.entity.ProblemCategory;
import cn.tycoding.biz.mapper.CategoryMapper;
import cn.tycoding.biz.mapper.ProblemCategoryMapper;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ProblemCategoryService extends IService<ProblemCategory> {

    /**
     * 新增
     * @param problemCategory
     */
    void add(ProblemCategory problemCategory);

    /**
     * 根据题目ID删除
     *@param id
     */
    void deleteByProblemId(Long id);

    /**
     * 根据分类ID删除
     *@param id
     */
    void deleteByCategoryId(Long id);

}
