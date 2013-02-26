package check;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UsersDAO;

import entitys.Users;

public class Pass extends ActionSupport{
	String password;
	String newPassword;
	String reNewPassword;
	Users user;
	Prompt prompt;
	public String execute() throws Exception {
		prompt=new Prompt();
		user=new Users();
		user=(Users) ActionContext.getContext().getSession().get("user");
		if (password != null && newPassword != null && reNewPassword != null) {
			if (password.length() < 5 || password.length() > 9) {
				prompt.Alert("密码位数要5至9位");
				return "Error";
			}
			else if (newPassword.length() < 5 || newPassword.length() > 9) {
				prompt.Alert("密码位数要5至9位");
				return "Error";
			}
			else if (reNewPassword.length() < 5 || reNewPassword.length() > 9) {
				prompt.Alert("密码位数要5至9位");
				return "Error";
			}
			else if (!reNewPassword.equals(newPassword)) {
				prompt.Alert("重复密码与新密码不同");
				return "Error";
			}
			else if (!user.getPassword().equals(password)) {
				prompt.Alert("密码错误");
				return "Error";
			}
			
			return authenticate();
		}
		return "null";
	}
	


	private String authenticate() {
		// TODO Auto-generated method stub
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml"); // WebApplicationContextUtils.getWebApplicationContext(null);
		UsersDAO usersDAO = (UsersDAO) context.getBean("userDao");
		user.setPassword(newPassword);
		usersDAO.Update(user);
		prompt.JS("alert('修改成功，请重新登陆');" +
				"top.location='Login.jsp';");
		return "Scuess";
	}








	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getReNewPassword() {
		return reNewPassword;
	}
	public void setReNewPassword(String reNewPassword) {
		this.reNewPassword = reNewPassword;
	}
	
	
}
