package cn.tycoding.biz.service.impl;

import cn.tycoding.biz.entity.MulQuery;
import cn.tycoding.biz.entity.Problem;
import cn.tycoding.biz.mapper.MulQueryMapper;
import cn.tycoding.biz.mapper.OrganizationMapper;
import cn.tycoding.biz.mapper.PositionMapper;
import cn.tycoding.biz.mapper.TagMapper;
import cn.tycoding.biz.service.MulQueryService;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * @return
 * @Author: Q2
 */
@Service
public class MulQueryServiceImpl extends ServiceImpl<MulQueryMapper, MulQuery> implements MulQueryService {
    @Autowired
    private MulQueryMapper mulQueryMapper;
//    @Autowired
//    private OrganizationMapper organizationMapper;
//    @Autowired
//    private PositionMapper positionMapper;
//    @Autowired
//    private TagMapper tagMapper;

    @Override
    public IPage<Problem> findMulQuery(QueryPage queryPage, MulQuery mulQuery){
        IPage<Problem> page = new Page<>(queryPage.getPage(), queryPage.getLimit());

        //害 因为前端传回来的是string...
//        if (mulQuery.getOrganizations() != null && mulQuery.getOrganizations().size() > 0){
//            List<Long> otmp = new ArrayList<Long>();
//            mulQuery.getOrganizations().forEach(organization -> {
//                otmp.add(organization.getId());
//            });
//            System.out.println("otmp"+otmp);
//            mulQuery.setOrganizationIds(otmp);
//        }
//        if (mulQuery.getPositions() != null && mulQuery.getPositions().size() > 0){
//            List<Long> ptmp = new ArrayList<Long>();
//            mulQuery.getPositions().forEach(position -> {
//                ptmp.add(position.getId());
//            });
//            System.out.println("ptmp"+ptmp);
//            mulQuery.setPositionIds(ptmp);
//        }
//        if (mulQuery.getTags() != null && mulQuery.getTags().size() > 0){
//            List<Long> ttmp = new ArrayList<Long>();
//            mulQuery.getTags().forEach(tag -> {
//                ttmp.add(tag.getId());
//            });
//            System.out.println("ttmp"+ttmp);
//            mulQuery.setPositionIds(ttmp);
//        }
        IPage<Problem> selectPage =  mulQueryMapper.doMulQuery(page, mulQuery);
        return selectPage;
    }
}
