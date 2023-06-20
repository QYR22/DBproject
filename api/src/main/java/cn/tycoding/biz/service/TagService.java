package cn.tycoding.biz.service;

import cn.tycoding.biz.entity.Tag;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface TagService extends IService<Tag> {

    IPage<Tag> list(Tag tag, QueryPage queryPage);
    IPage<Tag> listByUser(Long userId, Tag tag, QueryPage queryPage);

    List<Tag> list(Tag sysTag);
    List<Tag> listByUser(Long userId, Tag tag);

    void add(Tag tag);

    void update(Tag tag);

    void delete(Long id);

    List<Tag> findTagByProblemId(Long id);

}
