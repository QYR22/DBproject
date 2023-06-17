package cn.tycoding.biz.service.impl;

import cn.tycoding.common.utils.QueryPage;
import cn.tycoding.biz.entity.Organization;
import cn.tycoding.biz.mapper.OrganizationMapper;
import cn.tycoding.biz.service.ProblemOrganizationService;
import cn.tycoding.biz.service.OrganizationService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements OrganizationService {

    @Autowired
    private OrganizationMapper organizationMapper;

    @Autowired
    private ProblemOrganizationService problemOrganizationService;

    @Override
    public IPage<Organization> list(Organization sysOrganization, QueryPage queryPage) {
        IPage<Organization> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        LambdaQueryWrapper<Organization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(sysOrganization.getName()), Organization::getName, sysOrganization.getName());
        queryWrapper.orderByDesc(Organization::getId);
        return organizationMapper.selectPage(page, queryWrapper);
    }
    // 根据当前用户筛选的 用户隔离version
    @Override
    public IPage<Organization> listByUser(Long userId, Organization organization, QueryPage queryPage){
        IPage<Organization> page = new Page<>(queryPage.getPage(), queryPage.getLimit());

        LambdaQueryWrapper<Organization> queryWrapper = new LambdaQueryWrapper<>();

        queryWrapper.like(StringUtils.isNotBlank(organization.getName()), Organization::getName, organization.getName());
        /*
        WHERE orgn_uid = userId
        */
        queryWrapper.eq(Organization::getUid, userId);
        //降序desc排列
        queryWrapper.orderByDesc(Organization::getId);
        return organizationMapper.selectPage(page, queryWrapper);
    }
    /** "组织"列表全用户 无隔离  */
    @Override
    public List<Organization> list(Organization sysOrganization) {
        LambdaQueryWrapper<Organization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(sysOrganization.getName()), Organization::getName, sysOrganization.getName());
        queryWrapper.orderByDesc(Organization::getId);
        return organizationMapper.selectList(queryWrapper);
    }
    /** "组织"列表用户隔离 */
    @Override
    public List<Organization> listByUser(Long userId, Organization organization){
        LambdaQueryWrapper<Organization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(organization.getName()), Organization::getName, organization.getName());
        /*
        WHERE orgn_uid = userId
        */
        queryWrapper.eq(Organization::getUid, userId);
        queryWrapper.orderByDesc(Organization::getId);
        return organizationMapper.selectList(queryWrapper);
    }
    /** 公司列表用户隔离 */
    @Override
    public List<Organization> plistByUser(Long userId, Organization organization){
        LambdaQueryWrapper<Organization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(organization.getName()), Organization::getName, organization.getName());
        /*
        WHERE orgn_uid = userId and pid=0
        */
        queryWrapper.eq(Organization::getUid, userId);
        queryWrapper.eq(Organization::getPid, 0);
        queryWrapper.orderByDesc(Organization::getId);
        return organizationMapper.selectList(queryWrapper);
    }
    /**
     * 查询数据库数据，并处理后返回 树形数据
     * @return 树形数据
     */
    @Override
    public List<Organization> listWithTreeByUser(Long userId, Organization organization) {
        LambdaQueryWrapper<Organization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(organization.getName()), Organization::getName, organization.getName());
        queryWrapper.eq(Organization::getUid, userId);
        queryWrapper.orderByDesc(Organization::getId);
        List<Organization>lists =  organizationMapper.selectList(queryWrapper);
        //找到所有该用户的organization数据了已经

        //开始造树
        List<Organization> result = lists.stream()
                //一级list 查找公司 uid=0
                .filter(menu -> menu.getPid()==0)
                // 查找部门并放到一级list中
                .map(menu -> {
                    menu.setChildrenTree(getChildren(menu.getId()));
                    return menu;
                })//根据id排序
                //结果收集
                .collect(Collectors.toList());
        return result;

    }
    /* 递归查找所有菜单的子菜单 */
    /**
     * 递归获取部门
     * @return 部门
     */
    public List<Organization> getChildren(Long pid) {
        LambdaQueryWrapper<Organization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Organization::getPid, pid);
        List<Organization>children =  organizationMapper.selectList(queryWrapper);
        return children;
    }

    /* 为方便下面的操作
     * exists()判断这个organization是否存在
     */
    private boolean exists(Organization organization) {
        LambdaQueryWrapper<Organization> queryWrapper = new LambdaQueryWrapper<>();
        /*
        WHERE orgn_uid = userId and orgn_name=name
        */
        queryWrapper.eq(Organization::getName, organization.getName());
        queryWrapper.eq(Organization::getUid, organization.getUid());
        return organizationMapper.selectList(queryWrapper).size() > 0 ? true : false;
    }

    @Override
    @Transactional
    public void add(Organization sysOrganization) {
        //不存在这个organization时才可以添加
        //organization这条tuple里面是包含orgn_uid的
        if (!exists(sysOrganization)) {
            organizationMapper.insert(sysOrganization);
        }
    }

    @Override
    @Transactional
    public void update(Organization sysOrganization) {
        organizationMapper.updateById(sysOrganization);
    }



    @Override
    @Transactional
    public void delete(Long id) {
        //先 删除该 "组织"文件夹organization 与 题目problem 关联的信息
        //即ref表中相对应内容
        problemOrganizationService.deleteByOrganizationId(id);
        //这里也是使用了从BaseMapper继承过来的方法
        //根据主键删除
        organizationMapper.deleteById(id);
    }

    @Override
    public List<Organization> findByProblemId(Long id) {
        return organizationMapper.findOrganizationByProblemId(id);
    }
}
