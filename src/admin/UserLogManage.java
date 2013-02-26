package admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import check.Prompt;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.DocumentsDAO;
import dao.UserLogDAO;

import entitys.UserLog;

public class UserLogManage extends ActionSupport {
	int Page=1;
	UserLog[] userLogs;
	String method="search";
	String searchName="";
	pageBean.PBUserLog pbUserLog;
	Prompt prompt;
	UserLogDAO userLogDAO;
	String Descriptionsip;


	public  String execute() {
		prompt=new Prompt();
		if(ActionContext.getContext().getSession().get("user")==null){
			prompt.JS("alert('超时，请重新登陆');" +
					"top.location='Login.jsp';");
			return "Login";
		}
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		userLogDAO = (UserLogDAO) context.getBean("userLogDAO");
		if(method.equals("search")){
			Refresh();
			return "UserLogManage";				
		}
		return "input";
	}
	
	
	private void Refresh() {
		// TODO Auto-generated method stub
		List list = userLogDAO.findByLikeName(searchName);
		ArrayList arrayList = new ArrayList(list);
		pbUserLog = new pageBean.PBUserLog(arrayList, "");
		if (pbUserLog.getPageEndRow() - pbUserLog.getPageStartRow() > 0) {
			if(Page>pbUserLog.totalPages){
				Page=1;
			}
			userLogs =  pbUserLog.getPostPage(Page);
			this.setDescriptionsip(pbUserLog.getDescriptionsip(searchName));
		}
	}


	public int getPage() {
		return Page;
	}
	public void setPage(int page) {
		Page = page;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public pageBean.PBUserLog getPbUserLog() {
		return pbUserLog;
	}
	public void setPbUserLog(pageBean.PBUserLog pbUserLog) {
		this.pbUserLog = pbUserLog;
	}


	public UserLog[] getUserLogs() {
		return userLogs;
	}


	public void setUserLogs(UserLog[] userLogs) {
		this.userLogs = userLogs;
	}
	public String getDescriptionsip() {
		return Descriptionsip;
	}


	public void setDescriptionsip(String descriptionsip) {
		Descriptionsip = descriptionsip;
	}
}
