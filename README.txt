=====================================================================
                                                                       
                              ======                                   
                              README                                   
                              ======                                   
                                                                       
                            文档共享网站
                            2013-06-23
                                                                              
                                                                       
=====================================================================


使用myeclipse10.1打开,平台为JRE1.6,系统为ubuntu.
项目打开后，mysql的链接配置在src/applicationContext.xml文件中的"jdbc:mysql://localhost:3306/ShareDocuments?characterEncoding=utf-8".
帐号名修改在"<property name="username" value="root"></property>"
密码修改"<property name="password" value="admin123"></property>"

需要先执行mysql导出的sql语句创建sql数据库才行，文件为压缩包的ShareDocuments.sql文件既是.
我的项目运行后前台http://ubuntu.ubuntu-domain:8080/DocumentsShare/
后台为http://ubuntu.ubuntu-domain:8080/DocumentsShare/admin/Login.jsp
默认管理员帐号密码为admin.


因做这个本是毕业设计的需求，做完了我也就不维护了....
项目地址设在https://github.com/danjk159/bysj.git，有装git的只要git clone https://github.com/danjk159/bysj.git一条命令就能下载了

Copyright:本项目是有搭载在SSH下的使用Weka作为环境分析的.基于Weka软件包是作为GPL协议发布的，所以本软件使用的也是GPL协议，详细请阅读COPYING.
欢迎各位参考使用.


