<%@ page language="java" pageEncoding="UTF-8"%>  
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="css/Alayout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="css/jquery-1.4.min.js"></script>
    <script type="text/javascript" src="css/Alayout.js"></script>
    <script type="text/javascript">
        function show() {
            $("#tainiFrame").show();
        }
    </script>
    <style type="text/css">
        html
        {
            overflow-x: hidden;
            overflow-y: auto;
        }
    </style>
    <title>文档共享网</title>
</head>
<body>
    <s:form name="ctl01" theme="simple" method="post" action="Index" id="ctl01">
 	<div id="">
			<div id="" style="background-color: #2D2D2D;height:35px" >
				<s:if test="user==null">
					<font color="#FFFFFF">用户名: </font><input type="text" maxlength="20" id="ctl01_user_name"
						value="" size="6" name="user.name" />
    				<font color="#FFFFFF">密码:</font> <input type="password" maxlength="16"
						id="ctl01_user_password" size="6" name="user.password" />
					<input type="submit" value="登陆" name="method:Login"
						id="ctl01__Login" />
					<input type="submit" value="注册" name="method:AddUser"
						id="ctl01__AddUser" />
					<s:fielderror  cssStyle="color:#2e10ff;text-align:left;margin-top:0px;">  
                 		<s:param>Error</s:param>   
            		</s:fielderror>
				</s:if>
				<s:else>
                	<font color="#FFFFFF">您好，<s:property value="user.name"></s:property></font>
					<a href="./admin/Login.jsp"> <input type="button" value="设置" /></a>
					<s:submit method="Logout" value="注销" />
				</s:else>
			</div>
        </div>  
        <div style="text-align:center;padding:50px;">
         <img src="images/logo.jpg" alt="logo"/><br/>
         <br/>
         <br/>
         <span  style="font-size:30px">文件名：<s:textfield name="Id"  size="30"  cssStyle="font-size:30px;height:30px" MaxLength="20"/>
         <s:submit method="Search" value="搜索"   cssStyle="font-size:20px;height:40px"/></span>
        </div>
    </div>
    </s:form>
</body>
</html>
        