package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.Organization;
import cn.tycoding.biz.entity.ProblemOrganization;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface ProblemOrganizationMapper extends BaseMapper<ProblemOrganization> {

    List<Organization> findOrganizationByProblemId(Long problemId);
}
