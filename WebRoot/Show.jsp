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
					<a href="./admin/Login.jsp"><input type="button" value="设置" /></a>
					<s:submit method="Logout" value="注销" />
				</s:else>
			</div>
         <div style="text-align:center;">
         
         <img src="images/logo.jpg" alt="logo" width="170px" height="50"/><br/><br/>
         
         <span  style="font-size:20px">文件名：<s:textfield name="Id"  size="30"  MaxLength="20" style="font-size:16px"/>
         <s:submit method="Search" value="搜索"   /></span>
         </div>
        </div>
        <br/>
        <div style="width:100%;height:10px;border-top:1px dashed #919191;" />
<center>


<table  style="float:left;width:100px;border-width:1px">
	<tr><td><p style="font-size:20px;text-align:center;">书籍推荐</p></td></tr>
	<s:iterator value="%{DocumentsApriori}">
	<s:if test="name!=null">
	<tr>
	<td>
	<br/>
	<a href="DocumentManage?method=look1&id=<s:property value="id"/>"><img src=".<s:property value="image"/>" alt="图片失效" style="display:block;width:150px;height:150px;"/> <br/>
	<p style="font-size:15px;text-align:center;"><s:property value="name" /></p>
	</td>
	</tr>
	</a>
	</s:if>
	</s:iterator>
	</tr>
</table>




<table border="0px" width="700" style="padding-right:200px" >
 <s:iterator value="%{documents}">
     <s:if test="name!=null">
		<tr><td colspan="3" style="text-align:center;"><a href="DocumentManage?method=look1&id=<s:property value="id"/>"><span style="font-size:25px;"><s:property value="name"/></span></a></td></tr>
		<tr><td colspan="3"><p>&nbsp&nbsp&nbsp  <s:property value="contents"/></p></td></tr>
		<tr>
			<td>作者:<s:property value="author"/></td> 
			<td style="text-align: center; width: 200px;"> 浏览次数：<s:property value="views"/></td>
			<td style="text-align: right;">日期：<s:date name="date" format="yyyy-MM-dd"/></td>
		</tr>
			<td colspan="3"><br/><div style="width:100%;height:10px;border-top:1px dashed #919191;" /></td>
</s:if>
</s:iterator>
</table>
 </center>

      <div  style="text-align: center">
    		<tr >
                <td colspan="6">
                <s:property value="%{descriptionsip}"  escape="false" />
                </td>
            </tr>
      </div>
    </s:form>
</body>
</html>
        