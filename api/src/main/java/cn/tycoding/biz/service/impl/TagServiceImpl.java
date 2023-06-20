package cn.tycoding.biz.service.impl;

import cn.tycoding.biz.entity.Tag;
import cn.tycoding.biz.mapper.TagMapper;
import cn.tycoding.biz.service.ProblemTagService;
import cn.tycoding.biz.service.TagService;
import cn.tycoding.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Autowired
    private ProblemTagService problemTagService;

    @Override
    public IPage<Tag> list(Tag sysTag, QueryPage queryPage) {
        IPage<Tag> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        LambdaQueryWrapper<Tag> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(sysTag.getName()), Tag::getName, sysTag.getName());
        queryWrapper.orderByDesc(Tag::getId);
        return tagMapper.selectPage(page, queryWrapper);
    }
    @Override
    public IPage<Tag> listByUser(Long userId, Tag tag, QueryPage queryPage){
        IPage<Tag> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        LambdaQueryWrapper<Tag> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(tag.getName()), Tag::getName, tag.getName());
        /*
        WHERE tag_uid = userId
        */
        queryWrapper.eq(Tag::getUid, userId);
        queryWrapper.orderByDesc(Tag::getId);
        return tagMapper.selectPage(page, queryWrapper);
    }

    @Override
    public List<Tag> list(Tag sysTag) {
        LambdaQueryWrapper<Tag> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(sysTag.getName()), Tag::getName, sysTag.getName());
        queryWrapper.orderByDesc(Tag::getId);
        return tagMapper.selectList(queryWrapper);
    }
    @Override
    public List<Tag> listByUser(Long userId, Tag tag){
        LambdaQueryWrapper<Tag> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(tag.getName()), Tag::getName, tag.getName());
        /*
        WHERE tag_uid = userId
        */
        queryWrapper.eq(Tag::getUid, userId);
        queryWrapper.orderByDesc(Tag::getId);
        return tagMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional
    public void add(Tag sysTag) {
        if (!exists(sysTag)) {
            tagMapper.insert(sysTag);
        }
    }

    private boolean exists(Tag sysTag) {
        LambdaQueryWrapper<Tag> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Tag::getName, sysTag.getName());
        queryWrapper.eq(Tag::getUid, sysTag.getUid());
        return tagMapper.selectList(queryWrapper).size() > 0;
    }

    @Override
    @Transactional
    public void update(Tag tag) {
        tagMapper.updateById(tag);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        //删除该标签与题目有关联的关联信息
        problemTagService.deleteByTagsId(id);

        tagMapper.deleteById(id);
    }

    @Override
    public List<Tag> findTagByProblemId(Long id) {
        return tagMapper.findTagByProblemId(id);
    }
}
