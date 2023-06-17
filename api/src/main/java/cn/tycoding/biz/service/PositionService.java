package cn.tycoding.biz.service;

import cn.tycoding.biz.entity.Position;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface PositionService extends IService<Position> {

    IPage<Position> list(Position position, QueryPage queryPage);
    IPage<Position> listByUser(Long userId, Position position, QueryPage queryPage);

    List<Position> list(Position position);
    List<Position> listByUser(Long userId, Position position);

    void add(Position position);

    void update(Position position);

    void delete(Long id);

    List<Position> findByProblemId(Long id);
}
