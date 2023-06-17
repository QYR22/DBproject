package cn.tycoding.biz.service;

import cn.tycoding.biz.entity.ProblemTag;
import com.baomidou.mybatisplus.extension.service.IService;

public interface ProblemTagService extends IService<ProblemTag> {

    /**
     * 新增关联关系
     *
     * @param problemTag
     */
    void add(ProblemTag problemTag);

    /**
     * 根据题目ID删除
     *
     * @param id
     */
    void deleteByProblemId(Long id);

    /**
     * 根据标签ID删除
     *
     * @param id
     */
    void deleteByTagsId(Long id);
}
