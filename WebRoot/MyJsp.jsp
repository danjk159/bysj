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
 	<div id="Wrap">
        <div id="Header">
            <ul>
            	<s:if test="user==null">
                <li>用户名:</li>
                <li><s:textfield name="user.name"  size="6"  MaxLength="20"></s:textfield></li>
                <li>密码:</li>
                <li><s:password name="user.password" size="6"  MaxLength="16"></s:password></li>
                <li><s:submit method="Login" value="登陆" /></li>
                </s:if><s:else>
                <li>您好，<s:property value="user.name"></s:property></li>
                <li><s:submit method="Logout" value="注销" /></li>
                </s:else>
            </ul>
        </div>
        <div id="Header">
            <s:fielderror  cssStyle="color:red;text-align:center;margin-top:-50px;">  
                 <s:param>Error</s:param>   
            </s:fielderror>
         <div style="text-align:center;">
         <span  style="font-size:30px">文档共享网</span><br/>
         <span  style="font-size:20px">文件名：<s:textfield name="Id"  size="30"  MaxLength="20"/>
         <s:submit method="Search" value="搜索"   /></span>
         </div>
        </div>
      
    </div>
    </s:form>
</body>
</html>
        