package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.Category;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface CategoryMapper extends BaseMapper<Category> {

    List<Category> findCategoryByProblemId(Long id);

}
