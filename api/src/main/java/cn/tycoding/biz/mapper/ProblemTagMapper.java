package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.ProblemTag;
import cn.tycoding.biz.entity.Tag;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;


public interface ProblemTagMapper extends BaseMapper<ProblemTag> {

    List<Tag> findTagByProblemId(Long problemId);
}
