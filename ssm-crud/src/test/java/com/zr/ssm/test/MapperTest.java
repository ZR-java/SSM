package com.zr.ssm.test;

import com.zr.ssm.bean.Dept;
import com.zr.ssm.bean.Emp;
import com.zr.ssm.bean.EmpExample;
import com.zr.ssm.mapper.DeptMapper;
import com.zr.ssm.mapper.EmpMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * 测试mapper层的工作
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml") //加载配置文件
public class MapperTest {

    @Autowired
    private DeptMapper deptMapper;
    @Autowired
    private EmpMapper empMapper;
    @Autowired
    SqlSession sqlSession;
    /**
     * 测试Dept
     */
    @Test
    public void testCRUD(){
        /*  原生的测试方法
        //1. 创建springioc容器
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        //2. 从容器中获取mapper
        DeptMapper deptMapper = context.getBean("deptMapper",DeptMapper.class);*/
        System.out.println(deptMapper);
        //1 插入几个部门
//        deptMapper.insertSelective(new Dept(null,"开发部"));
//        deptMapper.insertSelective(new Dept(null,"测试部"));
        //2 生成员工数据,测试员工插入
//        empMapper.insertSelective(new Emp(null,"Jerry","m","Jerry@163.com",1));
//        empMapper.insertSelective(new Emp(null,"Tom","m","Tom@163.com",2));
        //3 批量插入多个员工
//        for(){
//            empMapper.insertSelective(new Emp(null,...));
//        }
        EmpMapper mapper = sqlSession.getMapper(EmpMapper.class);
        for (int i=0;i<100;i++){
            String uid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Emp(null,uid,"M",uid+"@163.com",1));
        }
        System.out.println("批量完成!");
    }

}
