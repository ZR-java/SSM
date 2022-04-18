<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%--
        web路径问题:
        不以/开始的相对路径,找资源,以当前资源的路径为基准,经常容易出问题;
        以/开始的相对路径,找资源,以服务器的路径为准(http://localhost:8080)+需要加上项目名;
            http://localhost:8080/ssm_crud
    --%>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!--引入Bootstrap 样式-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://fastly.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
            integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
            crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
</head>

<body>

<!----------------------------------------- 员工修改的模态框Modal----------------------------------------- -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <!--表单-->
                <form class="form-horizontal" id="emp_update_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!--部门提交did即可-->
                            <select class="form-control" name="dId" id="dept_update_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

    <!-- -------------------------------------员工添加的模态框Modal------------------------------------------- -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <!--表单-->
                    <form class="form-horizontal" id="emp_add_form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@163.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <!--部门提交did即可-->
                                <select class="form-control" name="dId" id="dept_add_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!------------------------------------------搭建显示页面--------------------------------------------------------->
    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <!--按钮-->
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-success" id="emp_add_modal_btn">新增</button>
                <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
            </div>
        </div>
        <!--显示表格数据-->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="emps_table">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all">
                            </th>
                            <th>#</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
        <!--显示分页信息栏-->
        <div class="row">
            <!--分页文字信息-->
            <div class="col-md-6" id="page_info_area"></div>
            <!--显示页码导航栏-->
            <div class="row">
                <!--导航条信息-->
                <div class="col-md-6" id="page_nav_area"></div>
            </div>
        </div>
    </div>
    <!----------------------------------------------------脚本---------------------------------------------------->
    <script type="text/javascript">
        //定义总记录数
        var totalRecord,currentPage;
        //页面加载完成以后, 直接发送一个ajax请求, 要到分页数据
        $(function () {
            //去首页
            to_page(1);
        });

        function to_page(pn) {
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn="+pn,
                type:"GET",
                success:function (result) {
                    //1. 解析并显示员工数据
                    build_emps_table(result);
                    //2. 解析并显示分页信息
                    build_page_info(result);
                    //3. 解析并显示分页条
                    build_page_nav(result);
                }
            });
        }

        //1. 解析并显示员工数据--------------------------------------------------------------------------------------------
        function build_emps_table(result) {
            //清空table表格
            $("#emps_table tbody").empty();
            var emps = result.extend.pageInfo.list;
            $.each(emps,function (index,item) {
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.dept.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-success btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //为编辑按钮添加一个自定义的属性,来表示当前员工id
                editBtn.attr("edit-id",item.empId);

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //为删除按钮添加一个自定义的属性,来表示当前员工id
                delBtn.attr("delete-id",item.empId);

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //append方法执行完成以后还是返回原来的元素
                $("<tr></tr>")
                    .append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            });
        }
        //2. 解析并显示分页信息--------------------------------------------------------------------------------------------
        function build_page_info(result) {
            //清空数据
            $("#page_info_area").empty();
            $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页, " +
                "共"+result.extend.pageInfo.pages+"页, " +
                "共"+result.extend.pageInfo.total+"记录");
            totalRecord = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;
        }
        //3. 解析并显示导航条----------------------------------------------------------------------------------------
        function build_page_nav(result) {
            //清空数据
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").attr("class","pagination");
            //1. 首页
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            //2. 前一页
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            //是否有前一页,没有就禁用点击
            if (result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else {
                //添加单击事件
                firstPageLi.click(function () {
                    to_page(1);
                })
                prePageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum-1);
                })
            }

            //3. 下一页
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            //4. 末页
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            //是否有下一页,没有就禁用点击
            if (result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                //添加单击事件
                nextPageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum+1);
                })
                lastPageLi.click(function () {
                    to_page(result.extend.pageInfo.pages);
                })
            }
            //添加首页和前一页
            ul.append(firstPageLi).append(prePageLi);
            //遍历给ul中添加页码
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if (result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item);
                })
                ul.append(numLi);
            });
            //遍历页码之后添加下一页和末页
            ul.append(nextPageLi).append(lastPageLi);

            //把ul添加到nav标签中
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area")
        }

        //重置模态框内容和样式---------------------------------------------------------------------------------------------
        function reset_form(ele){
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }

        //点击新增按钮, 弹出模态框------------------------------------------------------------------------------------------
        $("#emp_add_modal_btn").click(function () {
            //清除表单数据(表单完整重置(表单的数据,表单的样式))  reset()是dom对象方法,先转换成dom对象
            reset_form("#emp_add_form");
            //发送ajax请求, 查出部门信息, 显示在下拉列表中
            getDepts("#dept_add_select");
            //弹出模态框
            $("#empAddModal").modal({
                //单击背景不退出
                backdrop: 'static'
            })
        })
        //查出所有的部门信息并显示在下拉列表中
        function getDepts(ele) {
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"GET",
                success:function (result) {
                    // console.log(result)
                    //1. 拿出的数据 {"code":100,"msg":"处理成功!",
                    //          "extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}
                    //清空数据
                    $(ele).empty();
                    //2.显示部门信息在下拉列表中
                    $.each(result.extend.depts,function (index,item) {
                        var optionEle = $("<option></option>").append(item.deptName).attr("value",item.deptId);
                        optionEle.appendTo(ele);
                    })
                }
            });
        }

        //校验样式信息的封装
        function show_validate_msg(ele,status,msg){
            //应该清空这个元素之前的样式
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            //判断
            if (status == "success"){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if (status == "error") {
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //校验表单数据格式的提示信息
        function validate_add_form(){
            //1. 先拿到要校验的数据, 使用正则表达式
            var empName = $("#empName_add_input").val();
            //允许字母数字3到16位,中文2到5位
            var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
            if(!regName.test(empName)){
                // alert("用户名可以是3到16位字母数字,2到5位中文!")
                show_validate_msg("#empName_add_input","error","用户名必须是6到16位字母数字,2到5位中文!");
                return false;
            }else {
                show_validate_msg("#empName_add_input","success","");
            };
            //2. 邮箱验证
            var email = $("#email_add_input").val();
            var regEmail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if (!regEmail.test(email)){
                // alert("邮箱格式错误!");
                show_validate_msg("#email_add_input","error","邮箱格式错误!");
                return false;
            }else{
                show_validate_msg("#email_add_input","success","");
            }
            return true;
        }

        //校验用户名是否可用
        $("#empName_add_input").change(function () {
            //发送ajax请求校验用户名是否可用
            var empName = this.value;
            $.ajax({
                url: "${APP_PATH}/checkUser",
                data: "empName="+empName,
                type: "POST",
                success: function (result) {
                    if (result.code==100){
                        show_validate_msg("#empName_add_input","success",result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-validate","success");
                    }else {
                        show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-validate","error");
                    }
                }
            })
        });

        //员工保存单击事件绑定
        $("#emp_save_btn").click(function () {
            //模态框中填写的表单数据提交到服务器进行保存
            //1. 先对要提交给服务器的数据进行校验
            if (!validate_add_form()){
                return false;
            }
            //2. 判断之前的ajax用户名校验是否成功,如果成功
            if ($(this).attr("ajax-validate") == "error"){
                //这行代码表示用户名重复之后(用户名重复校验是在输入框改变之后就进行的),
                //点击员工保存按钮后才开始校验用户名合法性,如果合法但是重复的话,输入框的样式和span里的内容都被清空了,
                //所以这里如果进来了,就重新对用户名输入框写前端错误样式
                show_validate_msg("#empName_add_input","error","用户名不可用!");
                return false;
            }
            //3. 发送ajax请求保存员工
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                //序列化表格中的内容为字符串
                data:$("#emp_add_form").serialize(),
                success:function (result) {
                    if (result.code == 100){
                        //员工保存成功后:
                        //1. 关闭模态框
                        $("#empAddModal").modal('hide');
                        //2. 跳转到刚保存的数据
                        //pageHelper插件会把大于总页码数的查询功能,总是显示最后一页数据
                        //所以发送ajax请求(明显大于总页数的数字就可以,这里使用的是总记录数)显示最后一页的数据即可
                        to_page(totalRecord);
                    }else {
                        //显示失败信息
                        // console.log(result);
                        //有哪个错误信息就显示哪个字段
                        if(undefined != result.extend.errorFields.email){
                            //显示邮箱错误信息
                            show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                        }
                        if (undefined != result.extend.errorFields.empName){
                            //显示员工名字错误信息
                            show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                        }
                    }
                }
            });
        })

        //点击编辑按钮, 绑定点击事件------------------------------------------------------------------------------------------
        //click是在按钮创建之前就绑定了事件,所以绑定不上
        //解决方法: 1. 在创建按钮时绑定   2. 绑定点击.live()事件,但是已经废弃删除   3. 使用on()事件
        $(document).on("click",".edit_btn",function () {
            //1. 查出员工信息
            getEmps($(this).attr("edit-id"));
            //2. 查出部门信息
            getDepts("#dept_update_select");
            //3. 把员工的id传递给模态框的更新按钮
            $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
            //4. 弹出模态框
            $("#empUpdateModal").modal({
                //单击背景不退出
                backdrop: 'static'
            })
        });

        //查询员工信息显示在模态框中
        function getEmps(id) {
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"GET",
                success:function (result) {
                    // console.log(result);
                    var empData = result.extend.emp;
                    $("#empName_update_static").text(empData.empName);
                    $("#email_update_input").val(empData.email);
                    //jQuery中val()可以设定一个select和一个多选的select的值
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#dept_update_select").val([empData.dId]);
                }
            });
        }

        //点击更新按钮,更新员工信息
        $("#emp_update_btn").click(function () {
            //检验邮箱信息
            var email = $("#email_update_input").val();
            var regEmail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if (!regEmail.test(email)){
                show_validate_msg("#email_update_input","error","邮箱格式错误!");
                return false;
            }else{
                show_validate_msg("#email_update_input","success","");
            }
            //发送ajax请求保存更新的员工信息
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
                type: "PUT",
                data: $("#emp_update_form").serialize(),
                success: function (result) {
                    //1. 关闭模态框
                    $("#empUpdateModal").modal("hide");
                    //2. 回到本页面
                    to_page(currentPage);
                }
            });
        });

        //绑定单个删除按钮点击事件
        $(document).on("click",".delete_btn",function () {
            //查找这个元素的父元素下面的第几个元素
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            //把员工的id传递给删除按钮
            var empId = $(this).attr("delete-id");
            if (confirm("确认删除【"+empName+"】吗?")){
                //确认,发送ajax请求即可
                $.ajax({
                    url:"${APP_PATH}/emp/"+empId,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        //回到本页
                        to_page(currentPage);
                    }
                });
            }
        });

        //check_all完成全选/全不选功能
        $("#check_all").click(function () {
            //原生的dom推荐使用prop修改或读取原生属性值, attr获取自定义的值
            $(".check_item").prop("checked",$(this).prop("checked"));
        });
        //check_item反选
        $(document).on("click",".check_item",function () {
            var flag = $(".check_item:checked").length==$(".check_item").length;
            $("#check_all").prop("checked",flag);
        })

        //点击全部删除,批量删除
        $("#emp_delete_all_btn").click(function () {
            var empNames = "";
            var del_ids = "";
            $.each($(".check_item:checked"),function () {
                //组装员工姓名和id字符串
                empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                del_ids += $(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            //去除empNames和del_ids多余的,(逗号)和-
            empNames = empNames.substring(0,empNames.length-1);
            del_ids = del_ids.substring(0,del_ids.length-1);
            //没有选中员工
            // if (del_ids.length==0){   这个方法也可以
            if ($(".check_item:checked").length==0){
                alert("你还没选中任何员工");
                return false;
            }
            if (confirm("确认删除【"+empNames+"】吗?")){
                //发送ajax请求删除
                $.ajax({
                    url:"${APP_PATH}/emp/"+del_ids,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        //回到当前页面
                        $("#check_all").prop("checked",false);
                        to_page(currentPage);
                    }
                });
            }
        });

    </script>
</body>
</html>
