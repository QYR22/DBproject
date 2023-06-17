package cn.tycoding.biz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
@TableName("category")
public class Category implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long uid;
    private Long pid;

    private String name;

    @JsonInclude(value = JsonInclude.Include.NON_EMPTY)
    @TableField(exist = false)
    private List<Category> childrenTree;
/**
 * DONE @JsonInclude(value = JsonInclude.Include.NON_EMPTY)
 * 控制序列化时是否包含空值或空集合
 * 如果在类或属性上使用了这个注解 并设置了value为JsonInclude.Include.NON_EMPTY
 * 在序列化时，如果该类或属性的值为空字符串、空数组、空集合或null，那么它将不会被输出。*/
}
