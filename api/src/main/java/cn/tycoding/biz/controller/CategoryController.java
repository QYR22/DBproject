package cn.tycoding.biz.controller;

import cn.tycoding.biz.entity.Category;
import cn.tycoding.biz.mapper.CategoryMapper;
import cn.tycoding.biz.service.CategoryService;
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

/* 分类文件夹功能接口 */
@RestController
@RequestMapping(CommonConstant.BASE_API + "/category")
@Api(value = "CategoryController", tags = {"分类文件夹功能接口"})
public class CategoryController extends BaseController {
    //对构造函数 标注为接口时注入该接口的Impl实现类
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CategoryMapper categoryMapper;

    // 根据当前用户显示他自己创建的category 带分页功能的
    @PostMapping("/list")
    public R<Map<String, Object>> list(@RequestBody Category category, QueryPage queryPage) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(super.getData(categoryService.listByUser(curUserId, category, queryPage)));
        //old version 无用户隔离 return new R<>(super.getData(categoryService.list(sysCategory, queryPage)));
    }

    @PostMapping("/filter/list")
    public R list(@RequestBody Category category) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(categoryService.listByUser(curUserId, category));
    }
    /* 查出所有父文件夹 */
    @PostMapping("/filter/plist")
    public R plist(@RequestBody Category category) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(categoryService.plistByUser(curUserId, category));
    }
    /**
     * 获取数据库数据，并处理成树形结构
     * @return 树形结构数据
     */
    @PostMapping("/selectAllWithTree")
    public R selectAllWithTree(@RequestBody Category category) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(categoryService.listWithTreeByUser(curUserId, category));
    }

    /* 查出该分类的子分类列表 */
    @GetMapping("/getSubCategories/{id}")
    public R getSubCategories(@PathVariable("id") Long id) {

        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        //这里不用再筛userId了 因为其pid=id的话 肯定是同用户的
        //if(pid==null) queryWrapper.isNull(Category::getPid);
        queryWrapper.eq(Category::getPid, id);
        return new R<>(categoryMapper.selectList(queryWrapper));
    }

    @GetMapping("/{id}")
    public R<Category> findById(@PathVariable("id") Long id) {
        return new R<>(categoryService.getById(id));
    }

    @PostMapping
    @Log("新增分类文件夹")
    public R save(@RequestBody Category category) {
        try {
            //设置好所属用户
            category.setUid(this.getCurrentUser().getId());
            //DONE 这里实现le父文件夹
            categoryService.add(category);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }

    @PutMapping
    @Log("更新分类文件夹")
    public R update(@RequestBody Category sysCategory) {
        try {
            categoryService.update(sysCategory);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    @Log("删除分类文件夹")
    public R delete(@PathVariable Long id) {
        try {
            categoryService.delete(id);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }
}
