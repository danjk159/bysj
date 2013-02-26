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
	<form id="form1"  method="post" action="DocumentManage" id="form1">
	 <s:hidden name="role"/>
	  <s:hidden name="viewName"/>
    <div id="StudentList">
        <h2>
            所在位置： 文档管理 > 文档管理</h2>
        <div id="Search">
            搜索
			<s:textfield  name="searchName" value="%{searchName}" />
            <input id="imgbtnSearch" align="absmiddle" type="image" style="border-width:0px;" src="images/AdminSearch.png" name="imgbtnSearch"/>
			<a href="DocumentManage?method=add">
				<img id="imgAddUp" style="border-width:0px;position: absolute; top: 11px; bottom: 1px; left: 527px;" src="images/Add.jpg">
			</a>
			<!--  input id="MutiDeleteUp" type="image"  style="border-width:0px;position: absolute; right: 0px; top: 12px;" onclick="mutiDelLink_Click()" OnClientClick="return confirm('确定要删除');" src="images/Del.jpg" -->
        </div>
        <table id="Student" border="1" width="720">
            <tr class="Stu">
             	<td>Id</td>
                <td>名称</td>
                <td>作者</td>
                <td>日期</td>
                <td>浏览次数</td>
                <td>操作</td>
            </tr>
            <s:iterator value="%{documents}">
            <s:if test="name!=null">
            <tr class="tr0">
            	<td width="70x"><s:property value="id"/></td>
	            <td width="70x"><s:property value="name"/></td>
	            <td width="70px"><s:property value="author"/></td>
	            <td width="70px"><s:date name="date" format="yyyy-MM-dd"/></td>
	            <td width="70px"><s:property value="views"/></td>
	            <td>
	            	<a href="CommentaryInfo?method=add&documentsId=<s:property value="id"/>">添加评论</a>
	            	<a href="DocumentManage?method=download&id=<s:property value="id"/>">下载文件</a>
	            	<s:if test="role==1">
	                <a href="DocumentManage?method=modify&id=<s:property value="id"/>">修改</a>
	                <a href="DocumentManage?method=delete&id=<s:property value="id"/>"><span>删除</span></a>
	                </s:if><s:elseif  test="role==0&&viewName==author">
	                	<a href="DocumentManage?method=modify&id=<s:property value="id"/>">修改</a>
	                	<a href="DocumentManage?method=delete&id=<s:property value="id"/>"><span>删除</span></a>
	                </s:elseif><s:elseif  test="role==0&&viewName!=author">
	                	<a href="DocumentManage?method=look&id=<s:property value="id"/>">查看</a>
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
    <div style="width:90%;height:300px;padding:10px 5px 15px 20px;" >
        	<span style="font-size:15px">书籍推荐</span>
        	<table>
        	 <tr>
        	 	<s:iterator value="%{DocumentsApriori}">
        	 	<s:if test="name!=null">
             	<td> 
             	<a href="DocumentManage?method=look&id=<s:property value="id"/>"><img src="..<s:property value="image"/>" alt="" width="150px" height="150px" /> <br/>
             	<s:property value="name" />
             	</td>
             	</a>
             	</s:if>
				</s:iterator>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
