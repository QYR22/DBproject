package cn.tycoding.biz.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @return
 * @Author: Q2
 */
@Data
public class MulQuery {
    //ApiModelProperty value字段为对属性的简单说明

    @ApiModelProperty(value="所属用户")
    private Long uid;


    @ApiModelProperty(value="最近编辑时间段")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date lastEdit;

    @ApiModelProperty(value="已完成or未完成")
    private int finished;

    @ApiModelProperty(value="文字题or代码题")
    private int type;

    @ApiModelProperty(value="掌握程度")
    private int stars;

    @ApiModelProperty(value="难度")
    private int difficult;


    @ApiModelProperty(value="category")
    private Long categoryId;


    @ApiModelProperty(value="organizations")
    private List<Long> organizationIds;

    @ApiModelProperty(value="positions")
    private List<Long> positionIds;

    @ApiModelProperty(value="tags")
    private List<Long> tagIds;


    public MulQuery(){
        this.lastEdit = null;
        this.finished = -1;
        this.type = -1;
        this.difficult = -1;
        this.stars = -1;
        this.categoryId = null;
        this.organizationIds = null;
        this.organizationIds = null;
        this.positionIds = null;
        this.tagIds = null;
    }

}
