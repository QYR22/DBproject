package cn.tycoding.biz.service.impl;

import cn.tycoding.biz.entity.*;
import cn.tycoding.biz.mapper.ProblemMapper;
import cn.tycoding.biz.service.*;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Service
public class ProblemServiceImpl extends ServiceImpl<ProblemMapper, Problem> implements ProblemService {

    @Autowired
    private ProblemMapper problemMapper;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private TagService tagService;
    @Autowired
    private ProblemCategoryService problemCategoryService;
    @Autowired
    private ProblemOrganizationService problemOrganizationService;
    @Autowired
    private ProblemPositionService problemPositionService;
    @Autowired
    private ProblemTagService problemTagService;

    @Override /* 找到某用户的题目 根据userId查询题目 */
    public List<Problem> findByUserId(Long userId){
        return problemMapper.findByUser(userId);
    }
    @Override
    public List<Problem> findByCategory(Long id) {
        return problemMapper.findByCategory(id);
    }
    @Override
    public List<Problem> findByOrganization(Long id) {
        return problemMapper.findByOrganization(id);
    }
    @Override
    public List<Problem> findByPosition(Long id) {
        return problemMapper.findByPosition(id);
    }
    @Override
    public List<Problem> findByTag(Long id) {
        return problemMapper.findByTag(id);
    }

    // 实现全文关键字查询 id查询其关联的题目
    //直接融合到总查询里面了
//    @Override
//    public IPage<Problem> findByWords(String queryText, Long userId, QueryPage queryPage){
//        LambdaQueryWrapper<Problem> queryWrapper = new LambdaQueryWrapper<>();
//        queryWrapper.eq(Problem::getUid, userId);
//
//        //!!实现应该是OR!! 用lambda表达式
//        queryWrapper.and(StringUtils.isNotBlank(queryText), wrapper ->
//            wrapper.like(Problem::getDes, queryText).or().like(Problem::getContent,queryText)
//        );
//
//        IPage<Problem> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
//        IPage<Problem> selectPage = problemMapper.selectPage(page, queryWrapper);
//        return selectPage;
//    }
    /**
     * 根据 entity 条件，查询全部记录and翻页
     * @param //page         分页查询条件（可以为 RowBounds.DEFAULT）
     * @param //queryWrapper 实体对象封装操作类（可以为 null）
     */
    //IPage<T> selectPage(IPage<T> page, @Param(Constants.WRAPPER) Wrapper<T> queryWrapper);


    /*
     * 根据Category id查询题目
     */
    @Override
    public IPage<Problem> findByCategoryPage(Long id, Long userId, QueryPage queryPage){
        //ProblemCategory problemCategory
        //创建一个QueryWrapper对象
        //QueryWrapper<Category> wrapper = new QueryWrapper<>();
        //前端提供category的id 后端再获取用户id 当前端传信号要求全列表时筛选用户即可
        // DONE category提供什么 query中判断id即可
        //DONE 构造条件查询语句 就是作用于后面动态SQL
        //if(id != null){
         //   wrapper.eq("c.id", id);
        //}
        //创建一个IPage对象
        IPage<Problem> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        IPage<Problem> selectPage =  problemMapper.findByCategoryPage(page,id,userId);
        return selectPage;
    }
    /*
     * 根据Organization id查询题目
     */
    @Override
    public IPage<Problem> findByOrganizationPage(Long id, Long userId, QueryPage queryPage){

        IPage<Problem> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        IPage<Problem> selectPage =  problemMapper.findByOrganizationPage(page,id,userId);
        return selectPage;
    }
    /*
     * 根据Position id查询题目
     */
    @Override
    public IPage<Problem> findByPositionPage(Long id, Long userId, QueryPage queryPage){

        IPage<Problem> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        IPage<Problem> selectPage =  problemMapper.findByPositionPage(page,id,userId);
        return selectPage;
    }
    /*
     * 根据Tag id查询题目
     */
    @Override
    public IPage<Problem> findByTagPage(Long id, Long userId, QueryPage queryPage){

        IPage<Problem> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        IPage<Problem> selectPage =  problemMapper.findByTagPage(page,id,userId);
        return selectPage;
    }



    //无用户隔离 old version
    @Override
    public IPage<Problem> list(Problem problem, QueryPage queryPage) {
        IPage<Problem> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        LambdaQueryWrapper<Problem> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Problem::getId);
        queryWrapper.like(StringUtils.isNotBlank(problem.getTitle()), Problem::getTitle, problem.getTitle());

        IPage<Problem> selectPage = problemMapper.selectPage(page, queryWrapper);
        findInit(selectPage.getRecords());
        return selectPage;
    }

    // 根据当前用户筛选的 用户隔离ver
    @Override
    public IPage<Problem> listByUser(Long userId, Problem problem, QueryPage queryPage){

        LambdaQueryWrapper<Problem> queryWrapper = new LambdaQueryWrapper<>();

        queryWrapper.like(StringUtils.isNotBlank(problem.getTitle()), Problem::getTitle, problem.getTitle());
        /*
        WHERE pblm_user_id = userId
        */
        queryWrapper.eq(Problem::getUid, userId);
        queryWrapper.orderByDesc(Problem::getId);
        queryWrapper.eq(problem.getType() != 0, Problem::getType, problem.getType());
        queryWrapper.eq(problem.getStars() != 0, Problem::getStars, problem.getStars());
        queryWrapper.eq(problem.getDifficult() != 0, Problem::getDifficult, problem.getDifficult());
        queryWrapper.ge(problem.getLastEdit() != null, Problem::getLastEdit, problem.getLastEdit());

        //!!实现应该是OR!! 用lambda表达式
        queryWrapper.and(StringUtils.isNotBlank(problem.getDes()), wrapper ->
                wrapper.like(Problem::getDes, problem.getDes()).or().like(Problem::getContent,problem.getDes())
        );

        IPage<Problem> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        IPage<Problem> selectPage = problemMapper.selectPage(page, queryWrapper);
        findInit(selectPage.getRecords());
        return selectPage;
    }

    /* 封装题目 category + organization + position + tag标签数据
    对应实体类里面的 category + list-->position organization tag */
    private void findInit(List<Problem> list) {
        if (!list.isEmpty()) {
            list.forEach(problem -> {
                List<Category> sysCategoryList = categoryService.findByProblemId(problem.getId());
                if (sysCategoryList.size() > 0) {
                    problem.setCategory(sysCategoryList.get(0));
                }
                List<Organization> organizationList = organizationService.findByProblemId(problem.getId());
                problem.setOrganizations(organizationList);
                List<Position> positionList = positionService.findByProblemId(problem.getId());
                problem.setPositions(positionList);
                List<Tag> tagList = tagService.findByProblemId(problem.getId());
                problem.setTags(tagList);
            });
        }
    }

    @Override
    public Problem findById(Long id) {
        Problem problem = problemMapper.selectById(id);
        if (problem != null) {
            List<Problem> problemList = new ArrayList<>();
            problemList.add(problem);
            findInit(problemList);
            return problem;
        }
        return null;
    }

    @Override
    @Transactional
    public void add(Problem problem) {
        //uid在controller就set了
        problem.setCreateTime(new Date());
        problem.setLastEdit(new Date());
        // 保存题目数据
        problemMapper.insert(problem);
        // 保存  题目-category + organization + position + tag  4表的关联
        this.updateProblemCatgOrgnPosnTag(problem);
    }

    /* 更新题目-category + organization + position + tag  4表的关联 */
    private void updateProblemCatgOrgnPosnTag(Problem problem) {

        if (problem.getId() > 0) {
            // 1. Category-Problem
            if (problem.getCategory() != null) {
                problemCategoryService.deleteByProblemId(problem.getId());
                //那就删掉原来的 insert新的
                Category category = categoryService.getById(problem.getCategory());
                if (category != null) {
                    problemCategoryService.add(new ProblemCategory(problem.getId(), category.getId()));
                }
            }
            // 2. Organization-Problem
            if (problem.getOrganizations() != null && problem.getOrganizations().size() > 0) {
                problemOrganizationService.deleteByProblemId(problem.getId());
                problem.getOrganizations().forEach(organization -> {
                    problemOrganizationService.add(new ProblemOrganization(problem.getId(), organization.getId()));
                });
            }
            // 3. Position-Problem
            if (problem.getPositions() != null && problem.getPositions().size() > 0) {
                problemPositionService.deleteByProblemId(problem.getId());
                problem.getPositions().forEach(position -> {
                    problemPositionService.add(new ProblemPosition(problem.getId(), position.getId()));
                });
            }
            // 4. Tag-Problem
            if (problem.getTags() != null && problem.getTags().size() > 0) {
                problemTagService.deleteByProblemId(problem.getId());
                problem.getTags().forEach(tag -> {
                    problemTagService.add(new ProblemTag(problem.getId(), tag.getId()));
                });
            }
        }
    }

    @Override
    @Transactional
    public void update(Problem problem) {
        // 更新题目最近修改时间
        problem.setLastEdit(new Date());
        problemMapper.updateById(problem);
        // 更新 题目--category + organization + position + tag  4表的关联
        updateProblemCatgOrgnPosnTag(problem);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        if (id != null && id != 0) {
            //删除题目-category的关联
            problemCategoryService.deleteByProblemId(id);
            //删除题目-organization的关联
            problemOrganizationService.deleteByProblemId(id);
            //删除题目-position的关联
            problemPositionService.deleteByProblemId(id);
            //删除题目-tag的关联
            problemTagService.deleteByProblemId(id);

            //最后删除题目
            problemMapper.deleteById(id);
        }
    }
}
