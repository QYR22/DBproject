package cn.tycoding.biz.controller;

import cn.tycoding.biz.entity.Organization;
import cn.tycoding.biz.mapper.OrganizationMapper;
import cn.tycoding.biz.service.OrganizationService;
import cn.tycoding.common.annotation.Log;
import cn.tycoding.common.constants.CommonConstant;
import cn.tycoding.common.controller.BaseController;
import cn.tycoding.common.exception.GlobalException;
import cn.tycoding.common.utils.QueryPage;
import cn.tycoding.common.utils.R;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/* 公司部门功能接口 */
@RestController
@RequestMapping(CommonConstant.BASE_API + "/organization")
@Api(value = "OrganizationController", tags = {"公司部门功能接口"})
public class OrganizationController extends BaseController {
    //对构造函数 标注为接口时注入该接口的Impl实现类
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private OrganizationMapper organizationMapper;

    // 根据当前用户显示他自己创建的organization 带分页功能的
    @PostMapping("/list")
    public R<Map<String, Object>> list(@RequestBody Organization organization, QueryPage queryPage) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(super.getData(organizationService.listByUser(curUserId, organization, queryPage)));
        //old version 无用户隔离 return new R<>(super.getData(organizationService.list(sysOrganization, queryPage)));
    }

    @PostMapping("/filter/list")
    public R list(@RequestBody Organization organization) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(organizationService.listByUser(curUserId, organization));
    }
    /* 查出所有公司 */
    @PostMapping("/filter/plist")
    public R plist(@RequestBody Organization organization) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(organizationService.plistByUser(curUserId, organization));
    }
    /**
     * 获取数据库数据，并处理成树形结构
     * @return 树形结构数据
     */
    @PostMapping("/selectAllOrgnWithTree")
    public R selectAllOrgnWithTree(@RequestBody Organization organization) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(organizationService.listWithTreeByUser(curUserId, organization));
    }

    /* 查出该 公司 的 部门 列表 */
    @GetMapping("/getSubOrganizations/{id}")
    public R getSubOrganizations(@PathVariable("id") Long id) {

        LambdaQueryWrapper<Organization> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Organization::getPid, id);
        return new R<>(organizationMapper.selectList(queryWrapper));
    }

    @GetMapping("/{id}")
    public R<Organization> findById(@PathVariable("id") Long id) {
        return new R<>(organizationService.getById(id));
    }

    @PostMapping
    @Log("新增公司部门")
    public R save(@RequestBody Organization organization) {
        try {
            //设置好所属用户
            organization.setUid(this.getCurrentUser().getId());
            //DONE 这里实现le公司OR部门
            organizationService.add(organization);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @PutMapping
    @Log("更新公司部门")
    public R update(@RequestBody Organization organization) {
        try {
            organizationService.update(organization);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    @Log("删除公司部门")
    public R delete(@PathVariable Long id) {
        try {
            organizationService.delete(id);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
