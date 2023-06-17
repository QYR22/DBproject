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
@TableName("organization")
public class Organization implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long uid;
    private Long pid;//部门指向公司

    private String name;

    public Organization() {
    }

    public Organization(String name) {
        this.name = name;
    }

    @JsonInclude(value = JsonInclude.Include.NON_EMPTY)
    @TableField(exist = false)
    private List<Organization> childrenTree;
}
