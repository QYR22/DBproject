package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.Position;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface PositionMapper extends BaseMapper<Position> {

    List<Position> findPositionByProblemId(Long id);
}
