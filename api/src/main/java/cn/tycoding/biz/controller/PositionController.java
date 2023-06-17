package cn.tycoding.biz.controller;

import cn.tycoding.biz.entity.Position;
import cn.tycoding.biz.service.PositionService;
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
@RequestMapping(CommonConstant.BASE_API + "/position")
@Api(value = "PositionController", tags = {"岗位接口"})
public class PositionController extends BaseController {

    @Autowired
    private PositionService positionService;

    @PostMapping("/list")
    public R findByPage(@RequestBody Position position, QueryPage queryPage) {
        // DONE  只显示当前用户的题目
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(super.getData(positionService.listByUser(curUserId, position, queryPage)));
    }
    //用户隔离
    @PostMapping("/filter/list")
    public R list(@RequestBody Position position) {
        Long curUserId = this.getCurrentUser().getId();
        return new R<>(positionService.listByUser(curUserId, position));
    }
    @GetMapping("/{id}")
    public R findById(@PathVariable Long id) {
        return new R<>(positionService.getById(id));
    }

    @PostMapping
    @Log("新增岗位")
    public R save(@RequestBody Position position) {
        try {
            //设置好岗位所属用户
            position.setUid(this.getCurrentUser().getId());
            positionService.add(position);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @PutMapping
    @Log("更新岗位")
    public R update(@RequestBody Position position) {
        try {
            positionService.update(position);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    @Log("删除岗位")
    public R delete(@PathVariable Long id) {
        try {
            positionService.delete(id);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
