package cn.tycoding.biz.service;

import cn.tycoding.common.utils.QueryPage;
import cn.tycoding.biz.entity.Category;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface CategoryService extends IService<Category> {
    /* 全局无用户隔离 */
    IPage<Category> list(Category sysCategory, QueryPage queryPage);
    // 根据当前用户筛选的 用户隔离version
    IPage<Category> listByUser(Long userId, Category category, QueryPage queryPage);


    /** 分类列表 全局无用户隔离 */
    List<Category> list(Category sysCategory);
    /** 分类列表用户隔离 */
    List<Category> listByUser(Long userId, Category category);
    /** 父分类列表用户隔离 */
    List<Category> plistByUser(Long userId, Category category);
    List<Category> listWithTreeByUser(Long userId, Category category);

    void add(Category sysCategory);

    void update(Category sysCategory);

    void delete(Long id);

    /* 根据ProblemId查询其关联的分类数据 */
    List<Category> findByProblemId(Long id);
}
