<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
  <form id="form1"  method="post" action="Procedure" id="form1">
   <s:hidden name="method" value="apriori"/>
   规则条数:<input name="NumRules" type="text"/><input type="submit"  value="生成" /><br/>
    <s:if test="result!=null">
    	 <s:property value="%{result}"  escape="false" />
    </s:if>
   </form>
  </body>
</html>
