<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<title></title>
<link href="css/siteindex.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/Acss.css" type="text/css" />
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
html {
	overflow-x: hidden;
	overflow-y: auto;
}

.style1 {
	background-color: #EDEDED;
	text-align: right;
	color: #575757;
	font-weight: bold;
	height: 60px;
}

.style2 {
	height: 60px;
	width: 428px;
}
</style>
<script type="text/javascript">
	function Cancel() {
			document.location.href = "CommentaryManage?Page=1";
	}
</script>
</head>
<body>
	<s:form name="form1" method="post" theme="simple"
		action="CommentaryInfo" id="form1">
		<s:hidden name="method" />
		<s:hidden name="Commentary.name" />
		<s:hidden name="Commentary.id" />
		<s:hidden name="Commentary.documentsId" />
		<s:hidden name="role"/>
		<s:hidden name="viewName"/>
		<s:if test="method!='look'">
		<div id="StudentList">
			<h2>所在位置： 评论管理 > 评论管理</h2>
			<table id="Revise" border="1" width="710">
				<tbody>
					<tr>
						<td width="80" class="style1">评论人</td>
						<td colspan="3" class="style2"><s:textfield
								name="Commentary.name" disabled="true" MaxLength="20"
								Style="vertical-align: top;"></s:textfield> <s:hidden
								name="documes:elsent.name" /></td>
					</tr>
					<td width="80" class="style1">文档Id</td>
					<td colspan="3" class="style2"><s:textfield
							name="Commentary.documentsId" disabled="true" MaxLength="20"
							Style="vertical-align: top;" Width="200px"></s:textfield></td>
					</tr>
					<tr>
						<td width="80" class="style1">日期</td>
						<td colspan="3" class="style2"><s:textfield
								name="Commentary.OperateTime" Style="vertical-align: top;"
								onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
								<s:param name="value">
									<s:date name="%{Commentary.OperateTime}"
										format="yyyy-MM-dd HH:mm:ss" />
								</s:param>
							</s:textfield> <s:fielderror cssStyle="color:red;text-align:center;margin-top:15px;">
								<s:param>OperateTimeError</s:param>
							</s:fielderror></td>
					</tr>
					<tr>
						<td width="80" class="style1">内容</td>
						<td colspan="3" class="style2"><s:textarea
								name="Commentary.context" required="true" cols="55" rows="10"></s:textarea>
							<s:fielderror
								cssStyle="color:red;text-align:center;margin-top:15px;">
								<s:param>ContextError</s:param>
							</s:fielderror></td>
					</tr>
				</tbody>
			</table>
			<input id="btnSure" class="revisebtn" type="submit" value="确定" name="btnSure"> 
			<input type="button" class="revisebtn" onclick="Cancel()" id="btnCancel" value="取消" name="btnCancel">
		</div>
		</s:if><s:else>
		<div id="StudentList">
			<h2>所在位置： 评论管理 > 评论管理</h2>
			<table id="Revise" border="1" width="710">
				<tbody>
					<tr>
						<td width="80" class="style1">评论人</td>
						<td colspan="3" class="style2"><s:textfield
								name="Commentary.name" disabled="true" MaxLength="20"
								Style="vertical-align: top;"></s:textfield> </td>
					</tr>
					<td width="80" class="style1">文档Id</td>
					<td colspan="3" class="style2"><s:textfield
							name="Commentary.documentsId" disabled="true" MaxLength="20"
							Style="vertical-align: top;" Width="200px"></s:textfield></td>
					</tr>
					<tr>
						<td width="80" class="style1">日期</td>
						<td colspan="3" class="style2"><s:textfield
								name="Commentary.OperateTime" disabled="true" Style="vertical-align: top;"
								onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
								<s:param name="value">
									<s:date name="%{Commentary.OperateTime}"
										format="yyyy-MM-dd HH:mm:ss" />
								</s:param></s:textfield>
					</tr>
					<tr>
						<td width="80" class="style1">内容</td>
						<td colspan="3" class="style2"><s:textarea
								name="Commentary.context" disabled="true" cols="55" rows="10"></s:textarea>
					</tr>
				</tbody>
			</table>
			<input id="btnSure" class="revisebtn" type="submit" value="确定" name="btnSure"> 
		</div>
		</s:else>
	</s:form>
</body>
</html>