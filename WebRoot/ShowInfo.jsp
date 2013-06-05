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
		
		<div id="StudentList">
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
		
	</s:form>
</body>
</html>