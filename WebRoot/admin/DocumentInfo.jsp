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
			document.location.href = "DocumentManage?Page=1";
	}
</script>
</head>
<body>
	<s:form name="form1" method="post" theme="simple"
		action="DocumentManage" enctype="multipart/form-data" id="form1">
		<s:hidden name="method" />
		<s:hidden name="document.ud0" />
		<s:hidden name="document.id" />
		<s:hidden name="document.image" />
		
		
		<s:if test="method=='look'">
		<div id="StudentList">
			<h2>所在位置： 文档管理 > 文档管理</h2>
			<table id="Revise" border="1" width="710">
				<tbody>
					<tr>
					<td width="80" class="style1">文档名</td>
					<td colspan="3" class="style2">
								<s:textfield name="document.name" disabled="true" MaxLength="20"
									Style="vertical-align: top;"></s:textfield>
					</td>
					</tr>
					<td width="80" class="style1">作者</td>
					<td colspan="3" class="style2"><s:textfield
							name="document.author" disabled="true" MaxLength="20"
							Style="vertical-align: top;" Width="200px"></s:textfield> 
					</tr>
					<tr>
						<td width="80" class="style1">日期</td>
						<td colspan="3" class="style2"><s:textfield
								name="document.date" disabled="true"
								Style="vertical-align: top;" onClick="WdatePicker()">
								<s:param name="value">
									<s:date name="%{document.date}" format="yyyy-MM-dd" />
								</s:param>
							</s:textfield>
					</tr>
					<tr>
						<td width="80" class="style1">描述</td>
						<td colspan="3" class="style2"><s:textarea
								name="document.contents" disabled="true"cols="55" rows="10"></s:textarea>
					</tr>
					<tr>
						<td width="80" class="style1">浏览次数</td>
						<td colspan="3" class="style2"><s:textfield
								name="document.views" disabled="true"
								Style="vertical-align: top;" Width="200px"></s:textfield> </td>
					</tr>
					<tr>
						<td width="80" class="style1">图片</td>
						<td colspan="3" class="style2"> <img
							src="..<s:property value="document.image"/>" alt="" width="150px"
							height="150px" /> 
					</tr>
				</tbody>
			</table>
			<input id="btnSure" class="revisebtn" type="submit" value="确定"
				name="btnSure">
				</input>
		</div>
		</s:if>
		
		<s:elseif test="method=='look1'">
		<div id="StudentList">
			<h2>所在位置： 文档管理 > 文档管理</h2>
			<table id="Revise" border="1" width="710">
				<tbody>
					<tr>
					<td width="80" class="style1">文档名</td>
					<td colspan="3" class="style2">
								<s:textfield name="document.name" disabled="true" MaxLength="20"
									Style="vertical-align: top;"></s:textfield>
					</td>
					</tr>
					<td width="80" class="style1">作者</td>
					<td colspan="3" class="style2"><s:textfield
							name="document.author" disabled="true" MaxLength="20"
							Style="vertical-align: top;" Width="200px"></s:textfield> 
					</tr>
					<tr>
						<td width="80" class="style1">日期</td>
						<td colspan="3" class="style2"><s:textfield
								name="document.date" disabled="true"
								Style="vertical-align: top;" onClick="WdatePicker()">
								<s:param name="value">
									<s:date name="%{document.date}" format="yyyy-MM-dd" />
								</s:param>
							</s:textfield>
					</tr>
					<tr>
						<td width="80" class="style1">描述</td>
						<td colspan="3" class="style2"><s:textarea
								name="document.contents" disabled="true"cols="55" rows="10"></s:textarea>
					</tr>
					<tr>
						<td width="80" class="style1">浏览次数</td>
						<td colspan="3" class="style2"><s:textfield
								name="document.views" disabled="true"
								Style="vertical-align: top;" Width="200px"></s:textfield> </td>
					</tr>
					<tr>
						<td width="80" class="style1">图片</td>
						<td colspan="3" class="style2"> 
						<img src="..<s:property value="document.image"/>" alt="" width="150px"
							height="150px" /> 
					</tr>
				</tbody>
			</table>
			<input id="btnSure" class="revisebtn" type="submit" value="确定"
				name="btnSure">
				</input>
		</div>
		</s:elseif>
		
		<s:else>
		<div id="StudentList">
			<h2>所在位置： 文档管理 > 文档管理</h2>
			<table id="Revise" border="1" width="710">
				<tbody>
					<tr>
						<td width="80" class="style1">文档名</td>
						<td colspan="3" class="style2"><s:if test="method=='add'">
								<s:textfield name="document.name" MaxLength="20"
									Style="vertical-align: top;"></s:textfield>
							</s:if> <s:else>
								<s:textfield name="document.name" disabled="true" MaxLength="20"
									Style="vertical-align: top;"></s:textfield>
								<s:hidden name="document.name" />
							</s:else>
							<s:file size="5" name="file" Style="vertical-align: top;" />
							<s:fielderror
								cssStyle="color:red;text-align:center;margin-top:15px;">
								<s:param>NameError</s:param>
							</s:fielderror>
						</td>
					</tr>
					<td width="80" class="style1">作者</td>
					<td colspan="3" class="style2"><s:textfield
							name="document.author" required="true" MaxLength="20"
							Style="vertical-align: top;" Width="200px"></s:textfield> <s:fielderror
							cssStyle="color:red;text-align:center;margin-top:15px;">
							<s:param>AuthorError</s:param>
						</s:fielderror></td>
					</tr>
					<tr>
						<td width="80" class="style1">日期</td>
						<td colspan="3" class="style2"><s:textfield
								name="document.date" required="true"
								Style="vertical-align: top;" onClick="WdatePicker()">
								<s:param name="value">
									<s:date name="%{document.date}" format="yyyy-MM-dd" />
								</s:param>
							</s:textfield> <s:fielderror
								cssStyle="color:red;text-align:center;margin-top:15px;">
								<s:param>DateError</s:param>
							</s:fielderror></td>
					</tr>
					<tr>
						<td width="80" class="style1">描述</td>
						<td colspan="3" class="style2"><s:textarea
								name="document.contents" required="true" cols="55" rows="10"></s:textarea>
							<s:fielderror
								cssStyle="color:red;text-align:center;margin-top:15px;">
								<s:param>ContentsError</s:param>
							</s:fielderror></td>
					</tr>
					<tr>
						<td width="80" class="style1">浏览次数</td>
						<td colspan="3" class="style2"><s:textfield
								name="document.views" required="true"
								Style="vertical-align: top;" Width="200px"></s:textfield></td>
						<s:fielderror
							cssStyle="color:red;text-align:center;margin-top:15px;">
							<s:param>ViewsError</s:param>
						</s:fielderror>
					</tr>
					<tr>
						<td width="80" class="style1">图片</td>
						<td colspan="3" class="style2"><s:file size="20" name="image"
								Style="vertical-align: top;" accept="image/jpeg" /> <br /> <img
							src="..<s:property value="document.image"/>" alt="" width="150px"
							height="150px" /> <s:fielderror
								cssStyle="color:red;text-align:center;margin-top:15px;">
								<s:param>ImageError</s:param>
							</s:fielderror></td>
					</tr>
				</tbody>
			</table>
			<input id="btnSure" class="revisebtn" type="submit" value="确定"
				name="btnSure"> <input type="button" class="revisebtn"
				onclick="Cancel()" id="btnCancel" value="取消" name="btnCancel">
		</div>
		</s:else>
		
		
	</s:form>
</body>
</html>