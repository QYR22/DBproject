package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.MulQuery;
import cn.tycoding.biz.entity.Problem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;
import org.mapstruct.Mapper;


@Mapper
public interface MulQueryMapper extends BaseMapper<MulQuery> {

    IPage<Problem> doMulQuery(IPage<Problem> page, @Param("mulQuery")MulQuery mulQuery);
}
