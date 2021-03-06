package com.zr.ssm.mapper;

import com.zr.ssm.bean.Emp;
import com.zr.ssm.bean.EmpExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmpMapper {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    int countByExample(EmpExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    int deleteByExample(EmpExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    int deleteByPrimaryKey(Integer empId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    int insert(Emp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    int insertSelective(Emp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    List<Emp> selectByExample(EmpExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    Emp selectByPrimaryKey(Integer empId);

    List<Emp> selectByExampleWithDept(EmpExample example);
    Emp selectByPrimaryKeyWithDept(Integer empId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    int updateByExampleSelective(@Param("record") Emp record, @Param("example") EmpExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    int updateByExample(@Param("record") Emp record, @Param("example") EmpExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    int updateByPrimaryKeySelective(Emp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_emp
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    int updateByPrimaryKey(Emp record);
}