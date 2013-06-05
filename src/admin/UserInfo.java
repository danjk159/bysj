package admin;

import java.io.File;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import check.Prompt;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.xml.internal.security.utils.IgnoreAllErrorHandler;

import dao.UsersDAO;

import entitys.Users;

public class UserInfo extends ActionSupport {
	String id;
	Users user;
	String btnSure;
	String rePassword;
	Users newUser;
	String option;
	UsersDAO usersDAO;
	Prompt prompt;
	public Users getNewUser() {
		return newUser;
	}

	public void setNewUser(Users newUser) {
		this.newUser = newUser;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
	
	public String getBtnSure() {
		return btnSure;
	}

	public void setBtnSure(String btnSure) {
		this.btnSure = btnSure;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	
	public  String execute() throws Exception {
//		if(ActionContext.getContext().getSession().get("user")==null){
//			prompt=new Prompt();
//			prompt.JS("alert('超时，请重新登陆');" +
//					"top.location='Login.jsp';");
//			return "Login";
//		}
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml"); 
		usersDAO = (UsersDAO) context.getBean("userDao");
		if(option!=null&&btnSure!=null){
			user = usersDAO.findById(newUser.getName());
			if (option.equals("add")&&newUser.getName().equals("")) {
				this.addFieldError("NameError", "账号不能为空！");
				return "Error";
			}else if (option.equals("add")&& usersDAO.findById(newUser.getName())!=null) {
					this.addFieldError("NameError", "该帐号已被注册！");
					return "Error";
			}else if (option.equals("add")&&newUser.getEmail().equals("")) {
				this.addFieldError("EmailError", "邮箱不能为空！");
				return "Error";
			}else if (newUser.getRealName().equals("")) {
				this.addFieldError("RealNameError", "姓名不能为空！");
				return "Error";
			}else if (newUser.getPassword().equals("")) {
				this.addFieldError("PasswordError", "密码不能为空！");
				return "Error";
			}else if (newUser.getPassword().length()<5) {
				this.addFieldError("PasswordError", "密码位数不能小于5位！");
				return "Error";
			}else if (rePassword.equals("")) {
				this.addFieldError("rePasswordError", "重复密码位数不能为空！");
				return "Error";
			}else if (rePassword.length()<5) {
				this.addFieldError("rePasswordError", "重复密码位数不能小于5位！");
				return "Error";
			}else if(!rePassword.equals(newUser.getPassword())){
				this.addFieldError("rePasswordError", "重复密码与密码不同！");
				return "Error";
			}
		}
		return authenticate();
	}
	
	private String authenticate() throws Exception {
		// TODO Auto-generated method stub
		if(btnSure!=null){
			if (option.equals("modify")) {
				this.user.setBirthday(newUser.getBirthday());
				this.user.setPassword(newUser.getPassword());
				this.user.setRealName(newUser.getRealName());
				this.user.setRoles(newUser.getRoles());
				usersDAO.Update(this.user);
				if(((Users)ActionContext.getContext().getSession().get("user")).getRoles()==0){
					prompt=new Prompt();
					prompt.JS("alert('修改成功，转到登陆页面');" +
							"top.location='Login.jsp';");
					return "Login";
				}
			}else if (option.equals("add")) {//在后台登陆界面进行注册
				this.user=newUser;
				usersDAO.save(this.user);
				prompt=new Prompt();
				File file = new File("/Login.jsp");
				if(file.exists()){
				prompt.JS("alert('注册成功，转到登陆页面');" +
						"top.location='Login.jsp';");
				return "Login";
				}
			}else if (option.equals("addView")) {//在前台进行注册成功后的跳转
				this.user=newUser;
				usersDAO.save(this.user);
				prompt=new Prompt();
				prompt.JS("alert('注册成功，转到登陆页面');" +
						"top.location='../Index.jsp';");
				return "Login";
			}
			return "Scuess";
		}else{
			if (option != null) {
				if (option.equals("modify")) {
					if(((Users)ActionContext.getContext().getSession().get("user")).getRoles()==0){
						user = usersDAO.findById(((Users)ActionContext.getContext().getSession().get("user")).getName());
					}else{
						user = usersDAO.findById(id);
					}
					return "Modify";
				} else if (option.equals("add")) {
					return "Add";
				}
			} else {
			this.addFieldError("Error", "2！");
			return "Error";
		}
		return "Error";
		}
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user=user;
	}
}
