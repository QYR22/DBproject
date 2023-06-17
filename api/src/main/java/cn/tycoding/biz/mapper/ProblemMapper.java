package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.Problem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProblemMapper extends BaseMapper<Problem> {

    List<Problem> findByCategory(Long id);
    List<Problem> findByOrganization(Long id);
    List<Problem> findByPosition(Long id);
    List<Problem> findByTag(Long id);
    List<Problem> findByUser(Long id);

    /** DONE 分页!!
     * 根据Category id 查询题目
     * */
    IPage<Problem> findByCategoryPage(IPage<Problem> page, @Param("id") Long id, @Param("userId") Long userId);
    /**
     * 根据Organization id 查询题目
     * */
    IPage<Problem> findByOrganizationPage(IPage<Problem> page, @Param("id") Long id, @Param("userId") Long userId);

    /**
     * 根据Position id 查询题目
     * */
    IPage<Problem> findByPositionPage(IPage<Problem> page, @Param("id") Long id, @Param("userId") Long userId);
    /**
     * 根据Tag id 查询题目
     * */
    IPage<Problem> findByTagPage(IPage<Problem> page, @Param("id") Long id, @Param("userId") Long userId);
}
