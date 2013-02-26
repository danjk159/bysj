package admin;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import log.UserLogAdd;

import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import entitys.Users;

import check.Prompt;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.CommentaryDAO;
import entitys.Commentary;

public class CommentaryInfo extends ActionSupport {
	Prompt prompt;
	CommentaryDAO commentaryDAO;
	String method;
	int id;
	Commentary commentary=new Commentary();
	String btnSure;
	int documentsId;
	int role;
	String viewName;
	public String execute() {
		prompt=new Prompt();
		Users user=(Users)ActionContext.getContext().getSession().get("user");
		if(user==null){
			prompt.JS("alert('超时，请重新登陆');" +
					"top.location='Login.jsp';");
			return "Login";
		}
		setRole(((Users)ActionContext.getContext().getSession().get("user")).getRoles());
		setViewName(((Users)ActionContext.getContext().getSession().get("user")).getName());
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		commentaryDAO = (CommentaryDAO) context.getBean("commentaryDAO");
		if(btnSure!=null&&!btnSure.equals("") ){
			if(method.equals("add")){
  				if(validation()){
					Add();
					prompt.JS("location='CommentaryManage?Page=1';");
					return "CommentaryManage";	
				}else{
					return "input";
				}
			}else if(method.equals("modify")){
				if(validation()){
					Update();
					prompt.JS("location='CommentaryManage?Page=1';");
					return "CommentaryManage";
				}else{
					return "input";
				}
			}else if(method.equals("look")){
				prompt.JS("location='CommentaryManage?Page=1';");
				return "CommentaryManage";
			}
		}else {
			if(method.equals("add")){
				commentary=new Commentary();
				commentary.setName(user.getName());
				commentary.setOperateTime(new Date());
				if(documentsId!=0){
					commentary.setDocumentsId(documentsId);
					return "CommentaryInfo";
				}else {
					prompt.JS("alert('违规操作，请重新登陆');" +
							"top.location='Login.jsp';");
					return "Login";
				}
			}else if(method.equals("modify")){
				commentary=commentaryDAO.findById(id);
				return "CommentaryInfo";
			}else if (method.equals("delete")){
				commentary=commentaryDAO.findById(id);
				commentaryDAO.delete(commentary);
				new UserLogAdd(commentary, 3);
				prompt.JS("location='CommentaryManage?Page=1';");
				return "CommentaryManage";
			}else if(method.equals("look")){
				commentary = commentaryDAO.findById(id);
				new UserLogAdd(commentary, 5);
				return "CommentaryInfo";
			}
		}
		return "input";
	}
	private void Add() {
		// TODO Auto-generated method stub
		commentaryDAO.save(commentary);
		new UserLogAdd(commentary, 1);
	}
	private void Update() {
		// TODO Auto-generated method stub
		commentaryDAO.update(commentary);
		new UserLogAdd(commentary, 2);
	}
	
	public boolean validation(){
		if (commentary != null) {
			if (commentary.getOperateTime() == null) {
				addFieldError("OperateTimeError", "操作时间不能为空！");
				return false;
			}else if (commentary.getContext().length() < 6) {
				addFieldError("ContextError","评价字数不能小于6位!");
				return false;
			}
		}
		return true;
	}
	
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Commentary getCommentary() {
		return commentary;
	}
	public void setCommentary(Commentary commentary) {
		this.commentary = commentary;
	}
	public String getBtnSure() {
		return btnSure;
	}
	public void setBtnSure(String btnSure) {
		this.btnSure = btnSure;
	}
	public int getDocumentsId() {
		return documentsId;
	}
	public void setDocumentsId(int documentsId) {
		this.documentsId = documentsId;
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
