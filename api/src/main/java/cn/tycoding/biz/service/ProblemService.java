package cn.tycoding.biz.service;

import cn.tycoding.biz.entity.Problem;
import cn.tycoding.biz.entity.ProblemCategory;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ProblemService extends IService<Problem> {

    /**@param userId
     * 找到某用户的题目 根据查询题目 */
    List<Problem> findByUserId(Long userId);
    // 根据当前用户筛选的 用户隔离version
    IPage<Problem> listByUser(Long userId, Problem problem, QueryPage queryPage);

    /**
     * 根据CategoryId查询题目
     * @param id Category Id
     */
    List<Problem> findByCategory(Long id);

    /** DONE 分页!!
     * 根据Category查询题目
     * */
    //根据category id查询其关联的题目
    IPage<Problem> findByCategoryPage(Long id, Long userId, QueryPage queryPage);
    //根据category id查询其关联的题目
    IPage<Problem> findByOrganizationPage(Long id, Long userId, QueryPage queryPage);
    //根据position id查询其关联的题目
    IPage<Problem> findByPositionPage(Long id, Long userId, QueryPage queryPage);
    //根据tag id查询其关联的题目
    IPage<Problem> findByTagPage(Long id, Long userId, QueryPage queryPage);

    /**
     * 根据TagId查询题目
     * @param id Tag id
     */
    List<Problem> findByTag(Long id);


    // 这里使用IPage作返回值
    // 显示所有题目 没有用户隔离
    IPage<Problem> list(Problem problem, QueryPage queryPage);


    Problem findById(Long id);


    void update(Problem problem);

    void delete(Long id);

    void add(Problem problem);
}
