<%@ page language="java" pageEncoding="UTF-8"%>  
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>密码管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="css/jquery-1.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#close").click(function () {
            $('#tainiFrame', window.parent.document).hide();
        });
    });
</script>
<style type="text/css">
        html{  
        overflow-x: hidden;  
        overflow-y: auto;  
        }
    </style>
<title>修改密码</title>
<style type="text/css">
        *{
            margin:0;
            padding:0;
        }
        ul,ol{list-style:none; font-size:12px;}
        .main_form {
            padding: 10px 0;
            height:142px;
            
        }
        .main_form li {
            padding: 10px 0;
            *padding: 6px 0;
            clear: left;
            line-height: 200%;
        }
        .fm_left {
            float: left;
            text-align: right;
            padding-right: 6px;
            width: 130px;
        }
        .fm_right {
            float: left;
        }
        .input, .input_err, .input_ok, .input_on {
            width: 221px;
            height: 19px;
            border: 1px solid #C4C4C4;
            padding: 3px 0 0 3px;
            background: #F9F9F9;
        }
        .revisebtn{ padding:5px 20px; *padding:2px 10px; _padding:2px 10px; padding-top:5px; margin:9px 0px; margin-left:136px; color:#53617E;}
</style>
</head>

<body>
<s:property value="#session.mess" escape="false"/>
    <form name="form1" method="post" action="ChangePassword" id="form1">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE2ODIzOTA3MTJkZMdyhfUuai9EgK9ZCVePDihLRBsg" />
</div>

	    <table  width="100%"><tr><td align="right">
             <img  id="close" src="images/close-yellow.gif"/></td></tr></table> 
        <ul class="main_form">
            <li>
                <div class="fm_left">
                    现在的密码：
                </div>
                <div class="fm_right">
                    <input name="password" type="password" id="password" class="input" />
                </div>
            </li>
            <li>
                <div class="fm_left">
                    设置新的密码：
                </div>
                <div class="fm_right">
                    <input name="newPassword" type="password" id="newPassword" class="input" />
                </div>
            </li>
            <li>
                <div class="fm_left">
                    重复新的密码：
                </div>
                <div class="fm_right">
                    <input name="reNewPassword" type="password" id="reNewPassword" class="input" />
                </div>
            </li>
            <li>
                <input type="submit" name="btnSure" value="确认" id="btnSure" class="revisebtn" />
                <input type="submit" name="Button1" value="重置" id="Button1" class="revisebtn" style=" margin-left:50px;" />
            </li>
        </ul>
    
<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWBgLP9sj9DQK6lbb9CgLOpYWbDgLog4fiBgKQt6iSDAKM54rGBsvSHxPtPbudD1JvJhAhm9tuUce7" />
</div></form>
</body>
</html>