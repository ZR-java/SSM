package com.zr.ssm.controller;

import com.zr.ssm.bean.Dept;
import com.zr.ssm.bean.Msg;
import com.zr.ssm.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理和部门有关的请求
 */
@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    /**
     * 返回所有的部门信息
     */
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDeptsWithJson(){
        //查出的所有部门信息
        List<Dept> list = deptService.getAll();
        return Msg.success().add("depts",list);
    }

}
