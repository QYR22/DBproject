package cn.tycoding.biz.mapper;

import cn.tycoding.biz.entity.MulQuery;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Author: Q2
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class MulQueryMapperTest {

    @Autowired
    MulQueryMapper mulQueryMapper;

    MulQuery mulQuery = new MulQuery();


}
