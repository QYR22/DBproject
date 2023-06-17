## 技术栈

| Name | Version | Env | Version |
| -- | -- | -- | -- |
| SpringBoot | 2.3.1.RELEASE | JDK | 1.8 |
| Mybatis | 2.1.3 | MySQL | 5.7 |
| Spring-Shiro | 1.5.2 | IDEA | 2020.1 |

```java
/**
 * 根据 entity 条件，查询全部记录（并翻页）
 *
 * @param page         分页查询条件（可以为 RowBounds.DEFAULT）
 * @param queryWrapper 实体对象封装操作类（可以为 null）
 */
 IPage<T> selectPage(IPage<T> page, @Param(Constants.WRAPPER) Wrapper<T> queryWrapper);
```

nested exception is org.apache.ibatis.exceptions.PersistenceException: ### Error querying database. Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql :

 SELECT COUNT(1) FROM ( SELECT p.* FROM problem p WHERE p.id IN ( SELECT p.id FROM pblm_catg pc, problem p where 1 = 1 WHERE category_id = ? and p.id = pc.problem_id ) ) 

TOTAL ### The error may exist in file[E:\repository\DBproject\api\target\classes\mapper\ProblemMapper.xml] 

The error may involve defaultParameterMap

The error occurred while setting parameters 

Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error of sql :

 SELECT COUNT(1) FROM ( SELECT p.* FROM problem p WHERE p.id IN ( SELECT p.id FROM pblm_catg pc, problem p where 1 = 1 WHERE category_id = ? and p.id = pc.problem_id ) ) TOTAL
