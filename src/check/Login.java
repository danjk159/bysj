package check;

import java.util.List;

import log.UserLogAdd;

import org.hibernate.classic.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pageBean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UsersDAO;
import entitys.Users;

public class Login extends ActionSupport {
	Users user;
	String option;
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	String name;
	String password;
	int role;
	public  String execute() throws Exception {
		if (password != null && name != null) {
			return authenticate(name, password);
		}
		return "null";
	}

	private String authenticate(String name, String password) throws Exception {
		// TODO Auto-generated method stub
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml"); // WebApplicationContextUtils.getWebApplicationContext(null);
		UsersDAO usersDAO = (UsersDAO) context.getBean("userDao");
		user = usersDAO.findById(name);
		if (user != null) {
			if (user.getPassword().equals(password)) {
				ActionContext.getContext().getSession().put("user", user);
				setRole(user.getRoles());
				new UserLogAdd(user);
				return "Scuess";
			}
		}else{
			this.addFieldError("Error", "账号或密码错误！");
			return "Error";
		}
		this.addFieldError("Error", "账号或密码错误！");
		return "Error";
	}
	public String AddUser(){
		this.user=new Users();
		setOption("add");
		user.setName("AddUser");
		ActionContext.getContext().getSession().put("user", user);
		return "AddUser";
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
}
