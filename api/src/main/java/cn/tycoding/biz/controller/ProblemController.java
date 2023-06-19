package cn.tycoding.biz.controller;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import cn.tycoding.biz.entity.MulQuery;
import cn.tycoding.biz.service.MulQueryService;
import cn.tycoding.biz.service.ProblemService;
import cn.tycoding.common.constants.CommonConstant;
import cn.tycoding.biz.entity.Problem;
import cn.tycoding.common.annotation.Log;
import cn.tycoding.common.controller.BaseController;
import cn.tycoding.common.exception.GlobalException;
import cn.tycoding.common.utils.QueryPage;
import cn.tycoding.common.utils.R;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping(CommonConstant.BASE_API + "/problem")
@Api(value = "ProblemController", tags = {"题目功能接口"})
public class ProblemController extends BaseController {

    @Autowired
    private ProblemService problemService;
    @Autowired
    private MulQueryService mulQueryService;

    //list 没有分页的
    @GetMapping("/findByCategory/{id}")
    public R findByCategory(@PathVariable Long id) {
        return new R<>(problemService.findByCategory(id));
    }

    @GetMapping("/findByOrganization/{id}")
    public R findByOrganization(@PathVariable Long id) {
        return new R<>(problemService.findByOrganization(id));
    }

    @GetMapping("/findByPosition/{id}")
    public R findByPosition(@PathVariable Long id) {
        return new R<>(problemService.findByPosition(id));
    }

    @GetMapping("/findByTag/{id}")
    public R findByTag(@PathVariable Long id) {
        return new R<>(problemService.findByTag(id));
    }

    //DONE 有分页的findByCategory
    //这里使用get方法
    @GetMapping("/findByCategoryPage/{id}")
    public R findByCategoryPage(@PathVariable Long id, QueryPage queryPage) {
        Long curUserId = this.getCurrentUser().getId();
        //ProblemCategory problemCategory
        return new R<>(super.getData(problemService.findByCategoryPage(id, curUserId, queryPage)));
    }
    @GetMapping("/findByOrganizationPage/{id}")
    public R findByOrganizationPage(@PathVariable Long id, QueryPage queryPage) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(super.getData(problemService.findByOrganizationPage(id, curUserId, queryPage)));
    }

    @GetMapping("/findByPositionPage/{id}")
    public R findByPositionPage(@PathVariable Long id, QueryPage queryPage) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(super.getData(problemService.findByPositionPage(id, curUserId, queryPage)));
    }//TODO 题目和position tag categ orgn的关系

    @GetMapping("/findByTagPage/{id}")
    public R findByTagPage(@PathVariable Long id, QueryPage queryPage) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(super.getData(problemService.findByTagPage(id, curUserId, queryPage)));
    }

//    @PostMapping("/findMulQuery/")
//    public R findMulQuery(@RequestBody JSONObject params, QueryPage queryPage) {
    @PostMapping("/findMulQuery")
    public R findMulQuery(MulQuery params, QueryPage queryPage) {
        //TODO 这里传参一开始为什么为什么有bug?????
        Long curUserId = this.getCurrentUser().getId();
        params.setUid(this.getCurrentUser().getId());
        System.out.println(params.toString());

        return new R<>(super.getData(mulQueryService.findMulQuery(queryPage, params)));
    }
/*
Required request body is missing:
public cn.tycoding.common.utils.R
cn.tycoding.biz.controller.ProblemController.findMulQuery(java.util.Map<java.lang.String, java.lang.Object>,
cn.tycoding.common.utils.QueryPage)
* */

    //带分页功能的查询
    @PostMapping("/list")
    public R list(@RequestBody Problem problem, QueryPage queryPage) {
        // DONE 已完成:  只显示当前用户的题目
        //TODO 排序
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(super.getData(problemService.listByUser(curUserId, problem, queryPage)));
    }

    @PostMapping("/all")
    public R all(@RequestBody Problem problem, QueryPage queryPage) {
        //DONE 主页全显示
        return new R<>(super.getData(problemService.list(problem, queryPage)));
    }

    @GetMapping("{id}")
    public R findById(@PathVariable Long id) {
        return new R<>(problemService.findById(id));
    }

    //DONE 全文模糊查询
//    @GetMapping("{getPageByWords}")
//    public R findByWords(@RequestParam String queryText, QueryPage queryPage) {
//        //记得用户隔离哦
//        Long curUserId = this.getCurrentUser().getId();
//        return new R<>(problemService.findByWords(queryText, curUserId, queryPage));
//    }

    @PostMapping
    @Log("新增题目")
    public R add(@RequestBody Problem problem) {
        try {
            problem.setUid(this.getCurrentUser().getId());
            problemService.add(problem);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }

    @PutMapping
    @Log("更新题目")
    public R update(@RequestBody Problem problem) {
        try {
            problemService.update(problem);
            //problem.setUid(this.getCurrentUser().getId());
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    @Log("删除题目")
    public R delete(@PathVariable Long id) {
        try {
            System.out.println(this.getCurrentUser().getId());
            problemService.delete(id);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
