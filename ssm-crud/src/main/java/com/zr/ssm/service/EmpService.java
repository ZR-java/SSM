package com.zr.ssm.service;

import com.zr.ssm.bean.Emp;
import com.zr.ssm.bean.EmpExample;
import com.zr.ssm.mapper.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpService {

    @Autowired
    EmpMapper empMapper;

    /**
     * 批量删除
     * @param ids
     */
    public void deleteBatch(List<Integer> ids) {
        EmpExample example = new EmpExample();
        //delete from t_xxx where emp_id in(1,2,3...)
        example.createCriteria().andEmpIdIn(ids);
        empMapper.deleteByExample(example);
    }

    /**
     * 根据id删除员工
     * @param id
     */
    public void deleteEmp(Integer id) {
        empMapper.deleteByPrimaryKey(id);
    }

    /**
     * 员工更新
     * @param emp
     */
    public void updateEmp(Emp emp) {
        empMapper.updateByPrimaryKeySelective(emp);
    }

    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    public Emp getEmp(Integer id) {
        Emp emp = empMapper.selectByPrimaryKey(id);
        return emp;
    }

    /**
     * 检验用户名是否可用
     * @param empName
     * @return true: 代表当前姓名可用 false: 当前姓名不可用
     */
    public boolean checkUser(String empName) {
        EmpExample empExample = new EmpExample();
        empExample.createCriteria().andEmpNameEqualTo(empName);
        long count = empMapper.countByExample(empExample);
        return count == 0;
    }

    /**
     * 员工保存方法
     * @param emp
     */
    public void saveEmp(Emp emp) {
        empMapper.insertSelective(emp);
    }

    /**
     * 查询所有员工
     * @return
     */
    public List<Emp> getAll() {
        return empMapper.selectByExampleWithDept(null);
    }

}
