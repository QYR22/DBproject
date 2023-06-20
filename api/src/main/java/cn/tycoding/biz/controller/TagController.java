package cn.tycoding.biz.controller;

import cn.tycoding.biz.entity.Tag;
import cn.tycoding.biz.mapper.TagMapper;
import cn.tycoding.biz.service.TagService;
import cn.tycoding.common.annotation.Log;
import cn.tycoding.common.constants.CommonConstant;
import cn.tycoding.common.controller.BaseController;
import cn.tycoding.common.exception.GlobalException;
import cn.tycoding.common.utils.QueryPage;
import cn.tycoding.common.utils.R;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping(CommonConstant.BASE_API + "/tag")
@Api(value = "TagController", tags = {"标签管理接口"})
public class TagController extends BaseController {

    @Autowired
    private TagService tagService;
    @Autowired
    private TagMapper tagMapper;

    @PostMapping("/list")
    public R findByPage(@RequestBody Tag tag, QueryPage queryPage) {
        // DONE 已完成:  只显示当前用户的题目
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(super.getData(tagService.listByUser(curUserId, tag, queryPage)));
    }
    //用户隔离
    @PostMapping("/filter/list")
    public R list(@RequestBody Tag tag) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(tagService.listByUser(curUserId, tag));
    }

    @GetMapping("/{id}")
    public R findById(@PathVariable Long id) {
        return new R<>(tagService.getById(id));
    }
    @GetMapping("/findByProblem/{id}")
    public R findByProblem(@PathVariable Long id) {
        return new R<>(tagMapper.findTagByProblemId(id));
    }

    @PostMapping
    @Log("新增tag标签")
    public R save(@RequestBody Tag tag) {
        try {
            //设置好所属用户
            tag.setUid(this.getCurrentUser().getId());
            tagService.add(tag);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @PutMapping
    @Log("更新tag标签")
    public R update(@RequestBody Tag tag) {
        try {
            tagService.update(tag);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    @Log("删除tag标签")
    public R delete(@PathVariable Long id) {
        try {
            tagService.delete(id);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
