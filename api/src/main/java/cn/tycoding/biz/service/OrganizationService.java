package cn.tycoding.biz.service;

import cn.tycoding.common.utils.QueryPage;
import cn.tycoding.biz.entity.Organization;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface OrganizationService extends IService<Organization> {
    /* 全局无用户隔离 */
    IPage<Organization> list(Organization sysOrganization, QueryPage queryPage);
    // 根据当前用户筛选的 用户隔离version
    IPage<Organization> listByUser(Long userId, Organization organization, QueryPage queryPage);


    /** 公司部门列表 全局无用户隔离 */
    List<Organization> list(Organization sysOrganization);
    /** 公司部门列表用户隔离 */
    List<Organization> listByUser(Long userId, Organization organization);
    /** 公司部门列表用户隔离 */
    List<Organization> plistByUser(Long userId, Organization organization);
    List<Organization> listWithTreeByUser(Long userId, Organization organization);

    void add(Organization sysOrganization);

    void update(Organization sysOrganization);

    void delete(Long id);

    /* 根据ProblemId查询其关联的公司部门数据 */
    List<Organization> findByProblemId(Long id);
}
