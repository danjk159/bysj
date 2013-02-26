<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" >
    <title></title>
    <link href="css/siteindex.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/Acss.css" type="text/css" />
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        html
        {
            overflow-x: hidden;
            overflow-y: auto;
        }
        .style1
        {
            background-color: #EDEDED;
            text-align: right;
            color: #575757;
            font-weight: bold;
            height: 60px;
        }
        .style2
        {
            height: 60px;
            width: 428px;
        }
    </style>
    <script type="text/javascript">
    /*function Validation(){
    	var rePass = document.getElementById("tbRepeatPassword")
    	var Pass=document.getElementById("tbPassword")
    	if(Pass.value.length<5){
    		alert("密码的位数小于五位！")
  			return false
    	}
    	else if(rePass.value.length<5){
    		alert("重复密码的位数小于五位！")
    		return false
    	}
    	return true;
    }*/
	function Cancel() {
			document.location.href = "UserManage.jsp";
	}
</script>
</head>
<body>
    <form name="form1" method="post" action="UserInfo"  id="form1"><!--onSubmit="return Validation()"-->
    <input type="hidden" name="option" value=${option} />
    <div id="StudentList">
        <h2>
            所在位置： 用户管理 > 用户管理</h2>
        <table id="Revise" border="1" width="710">
        <s:if test="option=='modify'">
            <tbody>
                <tr>
                    <td width="80" class="style1">
                        帐号
                    </td>
                    <td colspan="3" class="style2">
                        <input name="newUser.name" value=${user.name} type="text" ID="tbName" disabled="disabled" MaxLength="20" Style="vertical-align: top;"
                            Width="200px"></input>
                        <input type="hidden" name="newUser.name" value=${user.name} />
                    </td>
                </tr>
                <td width="80" class="style1">
                        邮箱
                    </td>
                    <td colspan="3" class="style2">
                        <input name="newUser.email" value=${user.email} type="text"  ID="user.email" disabled="disabled" MaxLength="20" Style="vertical-align: top;"
                            Width="200px"></input>
                    </td>
                </tr>
                <tr>
                    <td width="80" class="style1">
                        姓名
                    </td>
                    <td colspan="3" class="style2">
                        <input name="newUser.realName" value=${user.realName} type="text"  ID="tbRealName" MaxLength="16" Style="vertical-align: top;"
                            Width="200px"></input>
                        <span class="red">* 字数控制在16字以内</span>
             <s:fielderror  cssStyle="color:red;text-align:center;margin-top:15px;">  
                 <s:param>NameError</s:param>   
            </s:fielderror>  
                    </td>
                </tr>
                <tr>
                    <td width="80" class="style1">
                        密码
                    </td>
                    <td colspan="3" class="style2">
                        <input name="newUser.password" value=${user.password} type="password"  ID="tbPassword" MaxLength="9" Style="vertical-align: top;"
                            Width="200px" TextMode="Password"></input>
                        <span class="red">* 字数控制在5到9以内</span>
            <s:fielderror  cssStyle="color:red;text-align:center;margin-top:15px;">  
                 <s:param>PasswordError</s:param>   
            </s:fielderror>  
                    </td>
                </tr>
                <tr>
                <td width="80" class="style1">
                        重复密码
                    </td>
                    <td colspan="3" class="style2">
                        <input name="rePassword" value=${user.password}  type="password"  ID="tbRepeatPassword"  MaxLength="9" Style="vertical-align: top;"
                            Width="200px" TextMode="Password"></input>
                        <span class="red">* 字数控制在5到9以内</span>
                    </td >
            	<s:fielderror  cssStyle="color:red;text-align:center;margin-top:15px;">  
                 	<s:param>rePasswordError</s:param>   
            	</s:fielderror>  
                </tr>
                <tr>
                <tr>
                <td width="80" class="style1">
                        生日
                    </td>
                    <td colspan="3" class="style2">
                        <input name="newUser.birthday" value=${user.birthday} class="Wdate" type="text" onClick="WdatePicker()" Style="vertical-align: top;"
                            Width="200px"></input>
                    </td>
                </tr>
            </tbody>
         </s:if >
         <s:else >
             <tbody>
                <tr>
                    <td width="80" class="style1">
                        帐号
                    </td>
                    <td colspan="3" class="style2">
                    
                        <input name="newUser.name"  type="text" ID="tbName" MaxLength="16" Style="vertical-align: top;"
                            Width="200px"></input>
                        <span class="red">* 字数控制在16字以内</span>
            <s:fielderror  cssStyle="color:red;text-align:center;margin-top:15px;">  
                 <s:param>NameError</s:param>   
            </s:fielderror>  
                    </td>
                </tr>
                <td width="80" class="style1">
                        邮箱
                    </td>
                    <td colspan="3" class="style2">
                        <input name="newUser.email" type="text"  ID="user.email"  MaxLength="32" Style="vertical-align: top;"
                            Width="200px"></input>
                            <span class="red">* 字数控制在32字以内</span>
             <s:fielderror  cssStyle="color:red;text-align:center;margin-top:15px;">  
                 <s:param>EmailError</s:param>   
            </s:fielderror>  
                    </td>
                </tr>
                <tr>
                    <td width="80" class="style1">
                        姓名
                    </td>
                    <td colspan="3" class="style2">
                        <input name="newUser.realName"  type="text"  ID="tbRealName" MaxLength="16" Style="vertical-align: top;"
                            Width="200px"></input>
                        <span class="red">* 字数控制在16字以内</span>
             <s:fielderror  cssStyle="color:red;text-align:center;margin-top:15px;">  
                 <s:param>RealNameError</s:param>   
            </s:fielderror>  
            </td>
                </tr>
                <tr>
                    <td width="80" class="style1">
                        密码
                    </td>
                    <td colspan="3" class="style2">
                        <input name="newUser.password"  type="password"  ID="tbPassword" MaxLength="9" Style="vertical-align: top;"
                            Width="200px" TextMode="Password"></input>
                        <span class="red">* 字数控制在5到9以内</span>
            <s:fielderror  cssStyle="color:red;text-align:center;margin-top:15px;">  
                 <s:param>PasswordError</s:param>   
            </s:fielderror>  
                    </td>
                </tr>
                <tr>
                <td width="80" class="style1">
                        重复密码
                    </td>
                    <td colspan="3" class="style2">
                        <input name="rePassword"  type="password"  ID="tbRepeatPassword"  MaxLength="9" Style="vertical-align: top;"
                            Width="200px" TextMode="Password"></input>
                        <span class="red">* 字数控制在5到9以内</span>
                 <s:fielderror  cssStyle="color:red;text-align:center;margin-top:15px;">  
                 <s:param>rePasswordError</s:param>   
            </s:fielderror>  
                    </td >
                    
                </tr>
                <tr>
                <tr>
                <td width="80" class="style1">
                        生日
                    </td>
                    <td colspan="3" class="style2">
                        <input name="newUser.birthday"  class="Wdate" type="text" onClick="WdatePicker()" Style="vertical-align: top;"
                            Width="200px"></input>
                    </td>
                </tr>
            </tbody>
         </s:else>
        </table>
        <input id="btnSure" class="revisebtn" type="submit"  value="确定" name="btnSure">
        <input type="button" class="revisebtn" onclick="Cancel()" id="btnCancel" value="取消" name="btnCancel">
    </div>
    </form>
</body>
</html>