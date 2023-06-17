package cn.tycoding.biz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("pblm_orgn")
public class ProblemOrganization implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField("problem_id")
    private Long problemId;

    @TableField("organization_id")
    private Long organizationId;

    public ProblemOrganization(Long problemId, Long organizationId) {
        this.problemId = problemId;
        this.organizationId = organizationId;
    }
}
