package com.zr.ssm.test;

import com.github.pagehelper.PageInfo;
import com.zr.ssm.bean.Emp;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用Spring测试模块提供的测试请求功能,测试crud请求的正确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"}) //加载配置文件
public class MvcTest {

    //传入springmvc的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟mvc请求,获取到处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5"))
                .andReturn();
        //请求成功以后,请求域中会有PageInfo,取出pageInfo进行验证
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码:"+pageInfo.getPageNum());
        System.out.println("总页码:"+pageInfo.getPages());
        System.out.println("总记录数:"+pageInfo.getTotal());
        System.out.println("导航分页的页码");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int i:nums){
            System.out.println(" "+i);
        }
        //获取员工数据
        List<Emp> list = pageInfo.getList();
        for (Emp emp:list){
            System.out.println("ID:"+emp.getEmpId()+"==>Name:"+emp.getEmpName());
        }
    }

}
