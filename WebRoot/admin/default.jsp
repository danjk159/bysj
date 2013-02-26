<%@ page language="java" pageEncoding="UTF-8"%>  
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="css/Alayout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="css/jquery-1.4.min.js"></script>
    <script type="text/javascript" src="css/Alayout.js"></script>
    <script type="text/javascript">
        function show() {
            $("#tainiFrame").show();
        }
    </script>
    <style type="text/css">
        html
        {
            overflow-x: hidden;
            overflow-y: auto;
        }
    </style>
    <title>文档共享系统</title>
</head>
<body>
    <form name="ctl01" method="post" action="Default.aspx" id="ctl01">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTEyNDQzMzE0OTEPZBYCAgMPZBYGAgUPDxYCHgRUZXh0BQVhZG1pbmRkAgcPDxYCHwAFD+ezu+e7n+euoeeQhuWRmGRkAgkPDxYCHwAFCjIwMTItMTItMTRkZGSjQ88oS+TtSG7g0+Tu2RXzHjM5/w==" />
</div>
 <%String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); %>
    <div id="Wrap">
    <s:hidden name="role"/>
        <div id="Header">
            <ul>
                <li><a href="../index.jsp" target="main">首 页</a> </li>
                <li>
                    <%--<a href="">修改密码</a>--%>
                    <a href="#" onclick="show()">修改密码</a> </li>
                <li>
                    <%--<a href="">注  销</a>--%>
                      <a href="Login.jsp">注销</a>
                </li>
                <li>
                    <%--<a href="">安全退出</a>--%>
                     <a onclick="javascript:window.close();">退出</a>
                </li>
            </ul>
        </div>
        <div id="Main">
            <div id="MainLt">
                <div id="Info">
                    <h2>
                    </h2>
                    <img src="images/Admin.png" />
                    <p>
                        用户：
                        <s:property value="user.name" />
                        <br />
                        身份：
                        <span id="lblUserType">
                        <s:if test="role==1">
                        系统管理员
                        </s:if><s:else>
                        普通用户
                        </s:else></span>
                        <br />
                        时间：
                        <%=datetime%>
                    </p>
                </div>
                <div id="Menu">
                    <h2>
                    </h2>
                    <ul id="FirstMenu">
                        <li><a class="heading collapsed">用户管理</a>
                            <ul class="navigation">
                            	<s:if test="role==1">
                                <li><a href="UserManage.jsp" target="main">用户管理</a></li>
                                </s:if>
                                <s:elseif test="role==0">
                                <li><a href="UserInfo?option=modify" target="main">用户管理</a></li>
                                </s:elseif>
                            </ul>
                        </li>
                        <li><a class="heading collapsed">文档管理</a>
                            <ul class="navigation">
                                <li><a href="DocumentManage?page=1" target="main">文档管理</a></li>
                            </ul>
                        </li>
                        <li><a class="heading collapsed">评论管理</a>
                            <ul class="navigation">
                                <li><a href="CommentaryManage?page=1" target="main">评论管理</a></li>
                            </ul>
                        </li>
                        <s:if test="role==1">
                        <li><a class="heading collapsed">日志管理</a>
                            <ul class="navigation">
                                <li><a href="UserLogManage?page=1" target="main">日志查看</a></li>
                            </ul>
                        </li>
                        <li><a class="heading collapsed">生成个性化推荐</a>
                            <ul class="navigation">
                                <li><a href="Procedure?method=apriori" target="main">关联规则生成</a></li>
                            </ul>
                        </li>
                        </s:if>
                    </ul>
                </div>
            </div>
            <div id="MainRt">
                <div id="MainRtLeft">
                </div>
                <div id="MainRtCon">
                    <iframe src="" scrolling="yes" name="main" frameborder="0" id="MainContent"></iframe>
                </div>
                <div id="MainRtRight">
                </div>
            </div>
            <div>
            </div>
        </div>
    </div>
    <div id="Footer">
        <span id="tainiFrame">
            <iframe id="AreaiFrame" scrolling="no" frameborder="1" src="Pass.jsp"></iframe>
        </span>
    </div>
    <div>
				    <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWAwKNzK2uBAKL0uqVDQKkwPvOCt9/lpORxvIRcOsm9PZGCuNcGa/M" />
    </div>
    </form>
</body>
</html>