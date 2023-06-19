package cn.tycoding.biz.service;

import cn.tycoding.biz.entity.MulQuery;
import cn.tycoding.biz.entity.Problem;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

public interface MulQueryService extends IService<MulQuery> {

    IPage<Problem> findMulQuery(QueryPage queryPage, MulQuery mulQuery);

}
