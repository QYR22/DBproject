package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.Position;
import cn.tycoding.biz.entity.ProblemPosition;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface ProblemPositionMapper extends BaseMapper<ProblemPosition> {

    List<Position> findPositionByProblemId(Long problemId);
}
