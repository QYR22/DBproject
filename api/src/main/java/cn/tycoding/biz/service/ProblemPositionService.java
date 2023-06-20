package cn.tycoding.biz.service;

import cn.tycoding.biz.entity.ProblemPosition;
import com.baomidou.mybatisplus.extension.service.IService;

public interface ProblemPositionService extends IService<ProblemPosition> {

    /**
     * 新增 题目-岗位 关联关系
     *
     * @param problemPosition
     */
    void add(ProblemPosition problemPosition);

    /**
     * 根据题目ID删除该关系
     *
     * @param id
     */
    void deleteByProblemId(Long id);

    /**
     * 根据岗位ID删除 该关系
     *
     * @param id
     */
    void deleteByPositionsId(Long id);
}
