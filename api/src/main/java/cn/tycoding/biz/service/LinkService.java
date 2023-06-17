package cn.tycoding.biz.service;

import cn.tycoding.biz.entity.SysLink;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface LinkService extends IService<SysLink> {

    List<SysLink> list(SysLink sysLink);

    IPage<SysLink> list(SysLink sysLink, QueryPage queryPage);

    void add(SysLink sysLink);

    void update(SysLink sysLink);

    void delete(Long id);
}
