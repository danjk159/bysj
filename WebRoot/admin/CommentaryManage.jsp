<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" >
    <link rel="stylesheet" href="css/Acss.css" type="text/css" />
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <title></title>
    <script type="text/javascript">
	//查找方法
	function btnAdd()
	{
		alert("添加评论需到文档管理中进行添加，即将跳转到管理页面");
		document.location.href="DocumentManage";
	}
	</script>
</head>
<body>
	<form id="form1"  method="post" action="CommentaryManage" id="form1">
		<s:hidden name="role"/>
		<s:hidden name="viewName"/>
    <div id="StudentList">
        <h2>
            所在位置： 评论管理 > 评论管理</h2>
        <div id="Search">
            搜索:文档Id
			<s:textfield theme="simple" name="searchName" />
            <input id="imgbtnSearch" align="absmiddle" type="image" style="border-width:0px;" src="images/AdminSearch.png" name="imgbtnSearch"/>
			<img id="imgAddUp" onclick="btnAdd()" style="border-width:0px;position: absolute; top: 11px; bottom: 1px; left: 527px;" src="images/Add.jpg">
		</div>
        <table id="Student" border="1" width="720">
            <tr class="Stu">
                <td>评论人</td>
                <td>文档Id</td>
                <td>评论时间</td>
                <td>操作</td>
            </tr>
            <s:iterator value="%{Commentarys}">
            <s:if test="name!=null">
            <tr class="tr0">
	            <td width="150px"><s:property value="name"/></td>
	            <td width="70px"><s:property value="documentsId"/></td>
	            <td width="150px"><s:date name="operateTime" format="yyyy-MM-dd HH:mm:ss"/></td>
	            <td >  
	            <s:if test="role==1">
	            	<a href="CommentaryInfo?method=modify&id=<s:property value="id"/>">修改</a>
	                <a href="CommentaryInfo?method=delete&id=<s:property value="id"/>"><span>删除</span></a>
	            </s:if><s:elseif  test="role==0&&viewName==name">
	            <a href="CommentaryInfo?method=modify&id=<s:property value="id"/>">修改</a>
	                <a href="CommentaryInfo?method=delete&id=<s:property value="id"/>"><span>删除</span></a>
	            </s:elseif><s:elseif  test="role==0&&viewName!=author">
	            	<a href="CommentaryInfo?method=look&id=<s:property value="id"/>">查看</a>
	            </s:elseif>
            	</td>
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
    <s:fielderror theme="simple" cssStyle="color:red;text-align:center;margin-top:15px;">  
		    	<s:param>searchName</s:param>   
	 </s:fielderror>
    </form>
		
</body>
</html>
