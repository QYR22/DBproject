package cn.tycoding.biz.service;

import cn.tycoding.biz.entity.ProblemOrganization;
import com.baomidou.mybatisplus.extension.service.IService;

public interface ProblemOrganizationService extends IService<ProblemOrganization> {

    /**
     * 新增
     * @param problemOrganization
     */
    void add(ProblemOrganization problemOrganization);

    /**
     * 根据题目ID删除
     *@param id
     */
    void deleteByProblemId(Long id);

    /**
     * 根据分类ID删除
     *@param id
     */
    void deleteByOrganizationId(Long id);

}
