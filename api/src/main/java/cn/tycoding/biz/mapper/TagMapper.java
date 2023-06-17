package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.Tag;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;


public interface TagMapper extends BaseMapper<Tag> {

    List<Tag> findTagByProblemId(Long id);
}
