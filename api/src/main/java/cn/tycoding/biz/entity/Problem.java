package cn.tycoding.biz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Data
@TableName("problem")
public class Problem implements Serializable {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /* 题目所属用户id */
    private Long uid;

    private String title;

    private String des;
    private String content;
    private String code;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField(value = "create_time")
    private Date createTime;

    private int type;

    private int finished;

    private int stars;

    private int difficult;


    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField(value = "last_edit")
    private Date lastEdit;

    @TableField(exist = false)
    private Organization organizations;

    @TableField(exist = false)
    private List<Position> positions;

    @TableField(exist = false)
    private List<Tag> tags;

    @TableField(exist = false)
    private Category category;


    @TableField(exist = false)
    public boolean isSortByDifficult;
    @TableField(exist = false)
    public boolean isSortByStars;
    @TableField(exist = false)
    public boolean isSortByCreateTime;
    @TableField(exist = false)
    public boolean isSortByLastEdit;
}
