package UnitTest;


import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;

import dao.UsersDAO;

import entitys.Users;

public class testSpring extends ActionSupport{
	
    Users nike;
    
	 public Users getNike() {
		return nike;
	}

	public void setNike(Users nike) {
		this.nike = nike;
	}

	public testSpring() {
		// TODO Auto-generated method stub
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml"); //WebApplicationContextUtils.getWebApplicationContext(null);
	    UsersDAO usersDAO=(UsersDAO)context.getBean("userDao");
	    nike=new Users();
		System.out.println("1111");
		List<Users> users=usersDAO.findAll();
		nike = users.get(2);
		System.out.println(nike == null);
		System.out.println(users.size());
		System.out.println(nike.getName()+" "+nike.getPassword());
	}
	
	
}