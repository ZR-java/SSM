package com.zr.ssm.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

public class Emp {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_emp.emp_id
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    private Integer empId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_emp.emp_name
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)",
            message = "用户名必须是6到16位字母数字,2到5位中文!")
    private String empName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_emp.gender
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    private String gender;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_emp.email
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
//    @Email这个注解也可以
    @Pattern(regexp = "^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$",
            message = "邮箱格式错误!")
    private String email;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_emp.d_id
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    private Integer dId;
    //希望查询员工信息的同时部门信息一起查询
    private Dept dept;

    public Emp() {
    }

    public Emp(Integer empId, String empName, String gender, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", dId=" + dId +
                ", dept=" + dept +
                '}';
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_emp.emp_id
     *
     * @return the value of t_emp.emp_id
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public Integer getEmpId() {
        return empId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_emp.emp_id
     *
     * @param empId the value for t_emp.emp_id
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_emp.emp_name
     *
     * @return the value of t_emp.emp_name
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public String getEmpName() {
        return empName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_emp.emp_name
     *
     * @param empName the value for t_emp.emp_name
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_emp.gender
     *
     * @return the value of t_emp.gender
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public String getGender() {
        return gender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_emp.gender
     *
     * @param gender the value for t_emp.gender
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_emp.email
     *
     * @return the value of t_emp.email
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_emp.email
     *
     * @param email the value for t_emp.email
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_emp.d_id
     *
     * @return the value of t_emp.d_id
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public Integer getdId() {
        return dId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_emp.d_id
     *
     * @param dId the value for t_emp.d_id
     *
     * @mbggenerated Sat Apr 09 21:37:21 CST 2022
     */
    public void setdId(Integer dId) {
        this.dId = dId;
    }
}