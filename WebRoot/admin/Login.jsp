<%@ page language="java" pageEncoding="UTF-8"%>  
<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head><link href="css/Login.css" rel="stylesheet" type="text/css" />

<title>
	文档共享后台管理系统
</title>
</head>
<body>
    <form name="form1" method="post" action="LoginCheck" id="form1">
    <div id="main">
        <div id="top">
            <span style="width:100%;">文档共享</span>
            <h3 style="width:100%;">在线系统</h3>
            <div style="clear:both;"></div>
        </div>
        <div id="bottom">
            <div class="inup">
            <label>用户名：</label><input name="name" type="text" id="name" style="width:140px;" />
            </div>
            <div class="inup">
            <label>密码：</label><input name="password" type="password" id="password" style="width:140px;" />
            </div>
            <s:fielderror  cssStyle="color:red;text-align:center;margin-top:15px;">  
                 <s:param>Error</s:param>   
            </s:fielderror>  
            <div class="btnLogin">
                 <input type="submit" name="ibLogin" value="登录" id="ibLogin" class="btn" />
                 <input type="reset" name="ibReset" value="重置" id="ibReset" class="btn" />
                 <s:submit method="AddUser" value="注册"  class="btn"/>
            <div style="clear:both;"></div>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    </form>
</body>
</html>
