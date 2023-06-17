package cn.tycoding.biz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName(value = "position")
public class Position implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long uid;

    private String name;

    @TableField(exist = false)
    private Long count;

    public Position() {
    }

    public Position(String name) {
        this.name = name;
    }

}
