package cn.tycoding.biz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;


@Data
@TableName("link")
public class SysLink implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String name;

    private String url;
}
