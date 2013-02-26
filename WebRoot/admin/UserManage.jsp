<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="dao.UsersDAO" %>
<%@ page import="pageBean.User" %>
<%@ page import="entitys.Users" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">

	<%
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml"); //WebApplicationContextUtils.getWebApplicationContext(null);
		UsersDAO usersDAO = (UsersDAO) context.getBean("userDao");
		String method = request.getParameter("method");
		if(method==null){
			method="";
		}
		String id = request.getParameter("id");
		if(id==null){
			id="";
		}
		String delId = request.getParameter("delId");
		if(delId==null){
			delId="";
		}
		String post = request.getParameter("page");
		if(post==null){
			post="1";
		}
		pageBean.User pageUser;
		if (method.equals("delete")) {
			Users user = usersDAO.findById(delId);
			if (user != null) {
				usersDAO.delete(user);
			}
		}
		pageUser = usersDAO.findUserAsPage(id);
		if((pageUser.getPageEndRow()-pageUser.getPageStartRow())>0){
		pageUser.getPostPage(Integer.parseInt(post));
		}
	%>
<script type="text/javascript">
	//查找方法
	function btnSearch()
	{
		var x=document.getElementById("tbSearch")
		document.location.href="UserManage.jsp?id="+x.value
		alert("UserManage.jsp?method=search&id="+x.value);
		
	}
	//删除方法

	function DelLink_Click(DelLink) {
		if (confirm("确实要删除吗?")) {
			var x = document.getElementById("tbSearch")
			document.location.href = "UserManage.jsp?method=delete&delId="
					+ DelLink.name
			alert("UserManage.jsp?method=delete&id=" + DelLink.name);
		}
	}
	//多个删除方法
	/*function mutiDelLink_Click() {
		var idsArray = new Array();
		var chk = document.getElementsByTagName("input");
		for ( var i = 0; i < chk.length; i++) {
			if (chk[i].type == "checkbox") {
				if (chk[i].name != null) {
					idsArray.push(chk[i].name);
				}
			}
		}

		document.location.href = "UserManage.action?method=mutiDelete&id="
				+ idsArray
		alert("UserManage.action?method=mutiDelete&id=" + idsArray);

	}*/
	function FormSelectAll() {
		var x = document.getElementById("CheckAll")
		var chk = document.getElementsByTagName("input");
		for ( var i = 0; i < chk.length; i++) {
			if (chk[i].type == "checkbox") {
				chk[i].checked = x.checked
			}
		}
	}
</script>
<head id="Head1" >
    <link rel="stylesheet" href="css/Acss.css" type="text/css" />
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
	<form id="form1"  method="post" action="LoginCheck" id="form1">
    <div id="StudentList">
        <h2>
            所在位置： 用户管理 > 用户管理</h2>
        <div id="Search">
            搜索
            <input type="text" id="tbSearch" maxlength="20" />
            <input id="imgbtnSearch" onclick="btnSearch()" align="absmiddle" type="image" style="border-width:0px;" src="images/AdminSearch.png" name="imgbtnSearch"/>
			<a href="UserInfo?option=add">
				<img id="imgAddUp" style="border-width:0px;position: absolute; top: 11px; bottom: 1px; left: 527px;" src="images/Add.jpg">
			</a>
			<!--  input id="MutiDeleteUp" type="image"  style="border-width:0px;position: absolute; right: 0px; top: 12px;" onclick="mutiDelLink_Click()" OnClientClick="return confirm('确定要删除');" src="images/Del.jpg" -->
        </div>
        <table id="Student" border="1" width="720">
            <tr class="Stu">
                <td> <!--input id="CheckAll" type="checkbox" value="" onclick="FormSelectAll()" /--></td>
                <td>账户</td>
                <td>姓名</td>
                <td>邮箱</td>
                <td>操作</td>
            </tr>
			<%if((pageUser.getPageEndRow()-pageUser.getPageStartRow())>0){
			for(Users u: pageUser.getUsList()){
			if(u!=null){%>
            <tr class="tr0">
	            <td><input ID="chk" type="checkbox" onclick="ChangeStyle('form1','chk');" /></td>
	            <td><%=u.getName()%></td>
	            <td><%=u.getRealName()%></td>
	            <td><%=u.getEmail()%></td>
	            <td>
	               <a href="UserInfo?option=modify&id=<%=u.getName()%>">修改</a>
	               <a ID="DelLink" name='<%=u.getName()%>' OnClick="DelLink_Click(this)"><span>删除</span></a>
	            </td>
            </tr>
			<%}}}%>
            <tr class="Stu">
                <td colspan="6">
                <%=pageUser.descriptionsip("用户", "UserManage.jsp")%>
                </td>
            </tr>
        </table>
    </div>
    </form>
		
</body>
</html>
