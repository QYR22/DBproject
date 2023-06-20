package cn.tycoding.biz.service.impl;

import cn.tycoding.common.utils.QueryPage;
import cn.tycoding.biz.entity.Category;
import cn.tycoding.biz.mapper.CategoryMapper;
import cn.tycoding.biz.service.ProblemCategoryService;
import cn.tycoding.biz.service.CategoryService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ProblemCategoryService problemCategoryService;

    @Override
    public IPage<Category> list(Category sysCategory, QueryPage queryPage) {
        IPage<Category> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(sysCategory.getName()), Category::getName, sysCategory.getName());
        queryWrapper.orderByDesc(Category::getId);
        return categoryMapper.selectPage(page, queryWrapper);
    }
    // 根据当前用户筛选的 用户隔离version
    @Override
    public IPage<Category> listByUser(Long userId, Category category, QueryPage queryPage){
        IPage<Category> page = new Page<>(queryPage.getPage(), queryPage.getLimit());

        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();

        queryWrapper.like(StringUtils.isNotBlank(category.getName()), Category::getName, category.getName());
        /*
        WHERE catg_uid = userId
        */
        queryWrapper.eq(Category::getUid, userId);
        //降序desc排列
        queryWrapper.orderByDesc(Category::getId);
        return categoryMapper.selectPage(page, queryWrapper);
    }
    /** 分类列表全用户 无隔离  */
    @Override
    public List<Category> list(Category sysCategory) {
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(sysCategory.getName()), Category::getName, sysCategory.getName());
        queryWrapper.orderByDesc(Category::getId);
        return categoryMapper.selectList(queryWrapper);
    }
    /** 分类列表用户隔离 */
    @Override
    public List<Category> listByUser(Long userId, Category category){
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(category.getName()), Category::getName, category.getName());
        /*
        WHERE catg_uid = userId
        */
        queryWrapper.eq(Category::getUid, userId);
        queryWrapper.orderByDesc(Category::getId);
        return categoryMapper.selectList(queryWrapper);
    }
    /** 父分类列表用户隔离 */
    @Override
    public List<Category> plistByUser(Long userId, Category category){
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(category.getName()), Category::getName, category.getName());
        /*
        WHERE catg_uid = userId and pid=0
        */
        queryWrapper.eq(Category::getUid, userId);
        queryWrapper.eq(Category::getPid, 0);
        queryWrapper.orderByDesc(Category::getId);
        return categoryMapper.selectList(queryWrapper);
    }
    /**
     * 查询数据库数据，并处理后返回 树形数据
     * @return 树形数据
     */
    @Override
    public List<Category> listWithTreeByUser(Long userId, Category category) {
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(category.getName()), Category::getName, category.getName());
        queryWrapper.eq(Category::getUid, userId);
        queryWrapper.orderByDesc(Category::getId);
        List<Category>lists =  categoryMapper.selectList(queryWrapper);
        //找到所有该用户的category数据了已经

        //开始造树
        List<Category> result = lists.stream()
                //一级list 查找父文件夹 uid=0
                .filter(menu -> menu.getPid()==0)
                // 查找子文件夹并放到一级list中
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
     * 递归获取子文件夹
     * @return 子文件夹
     */
    public List<Category> getChildren(Long pid) {
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Category::getPid, pid);
        List<Category>children =  categoryMapper.selectList(queryWrapper);
        return children;
    }

    /* 为方便下面的操作
     * exists()判断这个category是否存在
     */
    private boolean exists(Category category) {
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        /*
        WHERE catg_uid = userId and catg_name=name
        */
        queryWrapper.eq(Category::getName, category.getName());
        queryWrapper.eq(Category::getUid, category.getUid());
        return categoryMapper.selectList(queryWrapper).size() > 0 ? true : false;
    }

    @Override
    @Transactional
    public void add(Category sysCategory) {
        //不存在这个category时才可以添加
        //category这条tuple里面是包含catg_uid的
        if (!exists(sysCategory)) {
            categoryMapper.insert(sysCategory);
        }
    }

    @Override
    @Transactional
    public void update(Category sysCategory) {
        categoryMapper.updateById(sysCategory);
    }



    @Override
    @Transactional
    public void delete(Long id) {
        //先 删除该 分类文件夹category 与 题目problem 关联的信息
        //即ref表中相对应内容
        problemCategoryService.deleteByCategoryId(id);
        //这里也是使用了从BaseMapper继承过来的方法
        //根据主键删除
        categoryMapper.deleteById(id);
    }

    @Override
    public List<Category> findCategoryByProblemId(Long id) {
        return categoryMapper.findCategoryByProblemId(id);
    }
}
