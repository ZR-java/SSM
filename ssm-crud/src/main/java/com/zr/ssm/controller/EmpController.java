package com.zr.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zr.ssm.bean.Emp;
import com.zr.ssm.bean.Msg;
import com.zr.ssm.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理员工CRUD请求
 */
@Controller
public class EmpController {

    @Autowired
    private EmpService empService;

    /**
     * 单个删除,批量删除员工二合一
     * 批量删除: 1-2-3
     * 单个删除: 1
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("ids") String ids){
        if (ids.contains("-")){
            //创建一个list集合来装批量删除的id
            List<Integer> del_ids = new ArrayList<>();
            //分割字符串
            String[] str_ids = ids.split("-");
            //组装id的集合
            for (String id:str_ids){
                del_ids.add(Integer.parseInt(id));
            }
            empService.deleteBatch(del_ids);
        }else{
            //单个删除
            int id = Integer.parseInt(ids);
            empService.deleteEmp(id);
        }
        return Msg.success();
    }

    /**
     * 如果发送ajax=PUT形式请求
     * 封装的数据
     * Emp{empId=208, empName='null', gender='null', email='null', dId=null, dept=null}
     * 问题:
     * 请求体中有数据;但是Emp对象封装不上
     * 原因:
     * Tomcat: 将请求体中的数据,封装一个map
     *还是老老实实发送POST请求吧
     * 员工更新
     * @param emp
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg updateEmp(Emp emp){
        empService.updateEmp(emp);
        return Msg.success();
    }


    //根据id查询员工
    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public Msg getEmp(@PathVariable("id") Integer id){
        Emp emp = empService.getEmp(id);
        return Msg.success().add("emp",emp);
    }

    /**
     * 检查用户是否重名
     * @param empName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkUser")
    public Msg checkUser(@RequestParam("empName") String empName){
        //先判断用户名是否是合法的表达式
        String regex = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
        if (!empName.matches(regex)){
            return Msg.fail().add("va_msg","用户名必须是3-16位数字英文或者2-5位中文");
        }
        //数据库用户名重复校验
        boolean b = empService.checkUser(empName);
        if (b){
            return Msg.success().add("va_msg","用户名可用!");
        }else {
            return Msg.fail().add("va_msg","用户名不可用!");
        }
    }

    /**
     *员工保存
     * 1. 支持JSR303校验
     * 2. 导入Hibernate-Validator
     */
    @ResponseBody
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public Msg saveEmp(@Valid Emp emp, BindingResult result){
        if (result.hasErrors()){
            //校验失败,应该返回失败,在模态框中显示校验失败的错误信息
            Map<String,Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError:fieldErrors){
                System.out.println("错误的字段名:"+fieldError.getField());
                System.out.println("错误信息:"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            empService.saveEmp(emp);
            return Msg.success();
        }
    }

    /**
     * 导入jackson包
     * 查询所有员工数据(分页查询)
     * 使用json
     * @param pn
     * @return
     */
    @ResponseBody
    @RequestMapping("/emps")
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //引入PageHelper分页插件
        //在查询之前只要调用startPage(),传入页码,以及每页的页数
        PageHelper.startPage(pn,5);
        //startPage()后面紧跟的这个查询就是一个分页查询
        List<Emp> list = empService.getAll();
        //使用pageInfo包装查询后的结果,只需要将pageInfo交给页面就行
        //pageInfo封装了详细的分页信息,包括有我们查询出来的数据
        PageInfo<Emp> page = new PageInfo<>(list, 5);
        return Msg.success().add("pageInfo",page);
    }

    /**
     * 查询所有员工数据(分页查询)
     * 没用json格式的老方法
     * @return
     */
//    @RequestMapping("/emps")
    public String getEmp(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //引入PageHelper分页插件
        //在查询之前只要调用startPage(),传入页码,以及每页的页数
        PageHelper.startPage(pn,5);
        //startPage()后面紧跟的这个查询就是一个分页查询
        List<Emp> emps = empService.getAll();
        //使用pageInfo包装查询后的结果,只需要将pageInfo交给页面就行
        //pageInfo封装了详细的分页信息,包括有我们查询出来的数据
        PageInfo<Emp> page = new PageInfo<>(emps, 5);
        model.addAttribute("pageInfo",page);
        return "list";
    }

}
