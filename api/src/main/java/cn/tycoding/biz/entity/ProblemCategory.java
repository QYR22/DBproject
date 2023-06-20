package cn.tycoding.biz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName(value = "pblm_catg")
public class ProblemCategory implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField("problem_id")
    private Long problemId;

    @TableField("category_id")
    private Long categoryId;

    public ProblemCategory(Long problemId, Long categoryId) {
        this.problemId = problemId;
        this.categoryId = categoryId;
    }
}
