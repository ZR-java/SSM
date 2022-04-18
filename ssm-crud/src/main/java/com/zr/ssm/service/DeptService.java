package com.zr.ssm.service;

import com.zr.ssm.bean.Dept;
import com.zr.ssm.mapper.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {

    @Autowired
    private DeptMapper deptMapper;

    /**
     * 查询所有部门
     * @return
     */
    public List<Dept> getAll(){
        return deptMapper.selectByExample(null);
    }
}
