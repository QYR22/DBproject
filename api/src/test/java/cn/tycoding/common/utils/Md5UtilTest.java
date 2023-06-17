package cn.tycoding.common.utils;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/* 密码加密方法测试 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class Md5UtilTest {

    @Autowired
    private Md5Util md5Util;

    @Test
    public void encryptPassword() {
        /**
         * password（明文）: qinyiru
         * password（密文）: 5ed376acc1f8514604f9b5a3812873bb
         * password（明文）: caroline
         * password（密文）: 1dfb8155b433154794637d016a62de4b
         */
        String encryptPassword = md5Util.encryptPassword("qinyiru");
        System.out.println(encryptPassword);
    }
}
