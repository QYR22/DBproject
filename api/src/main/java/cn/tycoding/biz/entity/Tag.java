package cn.tycoding.biz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;


@Data
@TableName(value = "tag")
public class Tag implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long uid;

    private String name;

    @TableField(exist = false)
    private Long count;

    public Tag() {
    }

    public Tag(String name) {
        this.name = name;
    }
}
