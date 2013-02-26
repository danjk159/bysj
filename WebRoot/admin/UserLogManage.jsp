<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" >
    <link rel="stylesheet" href="css/Acss.css" type="text/css" />
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
	<form id="form1"  method="post" action="UserLogManage" id="form1">
    <div id="StudentList">
        <h2>
            所在位置： 日志管理 > 日志查看</h2>
        <div id="Search">
            搜索
			<s:textfield  name="searchName" value="%{searchName}" />
            <input id="imgbtnSearch" align="absmiddle" type="image" style="border-width:0px;" src="images/AdminSearch.png" name="imgbtnSearch"/>
		</div>
        <table id="Student" border="1" width="720">
            <tr class="Stu">
                <td>登陆名</td>
                <td>文档Id</td>
                <td>操作时间</td>
                <td>描述</td>
            </tr>
            <s:iterator value="%{userLogs}">
            <s:if test="name!=null">
            <tr class="tr0">
	            <td width="100px"><s:property value="name"/></td>
	            <td width="100px"><s:property value="documentsId"/></td>
	            <td width="100px"><s:date name="operateTime" format="yyyy-MM-dd"/></td>
	            <td><s:property value="operate"/></td>
            </tr>
            </s:if>
			</s:iterator>
            <tr class="Stu">
                <td colspan="6">
                <s:property value="%{descriptionsip}"  escape="false" />
                </td>
            </tr>
        </table>
    </div>
    </form>
		
</body>
</html>
