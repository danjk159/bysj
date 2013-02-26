package log;

import java.util.Date;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionContext;

import dao.DocumentsDAO;
import dao.UserLogDAO;
import entitys.Commentary;
import entitys.Documents;
import entitys.UserLog;
import entitys.Users;

public class UserLogAdd {
	
	static String LoginUser = "UnLogin";
	
	 /// <summary>
     /// 登录操作,并且记录用户名
     /// </summary>
     /// <param name="user"></param>
     public UserLogAdd(Users user){
    	 
    	 String operate="登陆未定义操作";
    	 if(user!=null){
    		 LoginUser = user.getName();
    		 if(user.getRoles().equals(1)){//1为管理员
    			 operate=LoginUser+"登录系统";
    		 }
    		 else if(user.getRoles().equals(2)){//2为普通用户
    			 operate=LoginUser+"登录系统";
    		 }
    		 else{
    			 operate="未定义用户登录系统";
    		 }
    	 }
    	 else{
    		 operate = LoginUser + "登录系统";
    	 }
		 OperAdd(OperType.Login.value, operate,null);
     }

     /// <summary>
     /// 文件日志,1为添加,2为修改,3为删除,4为下载，5为浏览
     /// </summary>
     /// <param name="documents"></param>
     /// <param name="Type">1为增加,2为修改,3为删除，4为下载，5为浏览</param>
	public UserLogAdd(Documents documents, int type) {
		Users user=(Users)ActionContext.getContext().getSession().get("user");
		LoginUser=user.getName();
		String operate = "";
		if (documents != null) {
			if (type > 0 && type <= 3) {
				switch (type) {
				case 1:
					operate = LoginUser + "上传Id为" + documents.getId() + "标题为"
							+ documents.getName() + "的文档";
					break;
				case 2:
					operate = LoginUser + "修改Id为" + documents.getId() + "标题为"
							+ documents.getName() + "的文档";
					break;
				case 3:
					operate = LoginUser + "删除Id为" + documents.getId() + "标题为"
							+ documents.getName() + "的文档";
					break;
				}
				OperAdd(OperType.Document.value, operate, documents.getId());
			} else if (type == 4) {
				operate = LoginUser + "下载Id为" + documents.getId() + "标题为"
						+ documents.getName() + "的文档";
				OperAdd(OperType.DownloadDocument.value, operate,
						documents.getId());
			} else if (type == 5) {
				
				ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
						"applicationContext.xml");
				DocumentsDAO documentsDAO = (DocumentsDAO) context.getBean("documentsDAO");
				documents.setViews(documents.getViews()+1);
				documentsDAO.update(documents);
				
				operate = LoginUser + "浏览Id为" + documents.getId() + "标题为"
						+ documents.getName() + "的文档";
				OperAdd(OperType.ViewDocument.value, operate, documents.getId());
			} else {
				operate = LoginUser + "未定义文件日志操作";
				OperAdd(OperType.UnKnown.value, operate, documents.getId());
			}
		}
		else
		{
			operate = LoginUser + "文档为null";
			OperAdd(OperType.UnKnown.value, operate, null);
		}
	}

	/// <summary>
     /// 评论日志，1为增加,2为修改,3为删除
     /// </summary>
     /// <param name="Commentary"></param>
     /// <param name="Type">1为增加,2为修改,3为删除</param>
	public UserLogAdd(Commentary commentary, int type) {
		String operate = "";
		Users user=(Users)ActionContext.getContext().getSession().get("user");
		LoginUser=user.getName();
		if (commentary != null) {
			switch (type) {
			case 1:
				operate = LoginUser + "添加Id为" + commentary.getId() + "评论人为"
						+ commentary.getName() + "的评论";
				break;
			case 2:
				operate = LoginUser + "修改Id为" + commentary.getId() + "评论人为"
						+ commentary.getName() + "的评论";
				break;
			case 3:
				operate = LoginUser + "删除Id为" + commentary.getId() + "评论人为"
						+ commentary.getName() + "的评论";
				break;
			default:
				operate = "未定义评论日志操作";
				break;
			}
			OperAdd(OperType.Commentary.value, operate, commentary.getId());
		} else {
			operate = LoginUser + "评论为null";
			OperAdd(OperType.UnKnown.value, operate, null);
		}
	}

     private void OperAdd(int operType, String operate,Integer documentsId)
     {
		 ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml"); 
		 UserLogDAO userLogDAO = (UserLogDAO) context.getBean("userLogDAO");
         UserLog userLog = new UserLog();
         userLog.setName(LoginUser);
         userLog.setOperateTime(new Date());
         userLog.setType( operType);
         userLog.setOperate(operate);
         
         userLog.setDocumentsId(documentsId);
         
         userLogDAO.save(userLog);
     }

     enum OperType
     {
    	 UnKnown(0),
         Login(1),
         Document(2),
         DownloadDocument(3),
         ViewDocument(4),
         Commentary (5);
         
         
         private int value;
         OperType(int value)
         {
        	 this.value=value;
         }
         
         public int getValue()
         {
        	 return value;
         }
         
         public String toString()
         {
        	 return  String.valueOf(value);
         }
     };
}
