package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.Organization;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface OrganizationMapper extends BaseMapper<Organization> {

    List<Organization> findOrganizationByProblemId(Long id);
}
