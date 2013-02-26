package admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import check.Prompt;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.CommentaryDAO;
import dao.UserLogDAO;
import entitys.Commentary;
import entitys.UserLog;
import entitys.Users;

public class CommentaryManage extends ActionSupport {
	int Page=1;
	Commentary[] commentarys;
	String method="search";
	int searchName=0;
	pageBean.PBCommentary pbCommentary;
	Prompt prompt;
	CommentaryDAO commentaryDAO;
	String Descriptionsip;

	int role;
	String viewName;
	
	public  String execute() {
		prompt=new Prompt();
		if(ActionContext.getContext().getSession().get("user")==null){
			prompt.JS("alert('超时，请重新登陆');" +
					"top.location='Login.jsp';");
			return "Login";
		}
		setRole(((Users)ActionContext.getContext().getSession().get("user")).getRoles());
		setViewName(((Users)ActionContext.getContext().getSession().get("user")).getName());
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		commentaryDAO = (CommentaryDAO) context.getBean("commentaryDAO");
		if(method.equals("search")){
			Refresh();
			return "CommentaryManage";				
		}
		return "input";
	}
	
	
	private void Refresh() {
		// TODO Auto-generated method stub
		List list;
		if(searchName!=0){
			list = commentaryDAO.findByDocumentsId(searchName);
		}else {
			list = commentaryDAO.findAll();
		}
		ArrayList arrayList = new ArrayList(list);
		pbCommentary = new pageBean.PBCommentary(arrayList, "");
		if (pbCommentary.getPageEndRow() - pbCommentary.getPageStartRow() > 0) {
			if (Page > pbCommentary.totalPages) {
				Page = 1;
			}
			commentarys = pbCommentary.getPostPage(Page);
			this.setDescriptionsip(pbCommentary.getDescriptionsip(searchName));
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
	public int getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName){
		try {
			this.searchName = Integer.parseInt(searchName);
		} catch (NumberFormatException nfe) {
			// TODO: handle exception
			 this.searchName= -1;
		}
		
	}
	public String getDescriptionsip() {
		return Descriptionsip;
	}


	public void setDescriptionsip(String descriptionsip) {
		Descriptionsip = descriptionsip;
	}
	public Commentary[] getCommentarys() {
		return commentarys;
	}


	public void setCommentarys(Commentary[] commentarys) {
		this.commentarys = commentarys;
	}


	public pageBean.PBCommentary getPbCommentary() {
		return pbCommentary;
	}


	public void setPbCommentary(pageBean.PBCommentary pbCommentary) {
		this.pbCommentary = pbCommentary;
	}
	public int getRole() {
		return role;
	}


	public void setRole(int role) {
		this.role = role;
	}


	public String getViewName() {
		return viewName;
	}


	public void setViewName(String viewName) {
		this.viewName = viewName;
	}



}
