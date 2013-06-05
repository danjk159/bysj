import java.util.ArrayList;
import java.util.List;

import log.UserLogAdd;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import pageBean.PBDocuments;
import pageBean.StagePBDocuments;

import check.Prompt;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;

import dao.DocumentsDAO;
import dao.TestDAO;
import dao.UsersDAO;

import entitys.Documents;
import entitys.Users;


public class Index extends ActionSupport {
	Users user;
	Prompt prompt;
	String Id;
	private DocumentsDAO documentsDAO;
	private StagePBDocuments pbDocuments;
	Documents[] DocumentsApriori;
	private int Page=1;
	private String method;
	int Did;//document的ID；
	private Documents[] documents;
	String descriptionsip;
	public String execute(){
		if(method.equals("look")){
			ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
					"applicationContext.xml");
			documentsDAO = (DocumentsDAO) context.getBean("documentsDAO");
			Documents document = documentsDAO.findById(Did);
			new UserLogAdd(document, 5);
			documentsDAO.update(document);
		}
		return Search();
	}
	String option;
	public String Login(){
		if (!user.getPassword().equals("") && !user.getName().equals("")) {
			ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
					"applicationContext.xml"); // WebApplicationContextUtils.getWebApplicationContext(null);
			UsersDAO usersDAO = (UsersDAO) context.getBean("userDao");
			String password = user.getPassword();
			user = usersDAO.findById(user.getName());
			if (user != null) {
				if (user.getPassword().equals(password)) {
					ActionContext.getContext().getSession().put("user", user);
					new UserLogAdd(user);
					return "Scuess";
				}
			}
		} 
		user=null;
		this.addFieldError("Error", "账号或密码错误！");
		return "input";
		
	}
	
	public String Logout(){
		user=null;
		ActionContext.getContext().getSession().put("user", null);
		return "input";
	}
	public String Search(){
		user=(Users)ActionContext.getContext().getSession().get("user");
		if(user!=null){
			ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
			TestDAO testDAO = (TestDAO) context.getBean("testDAO");
			DocumentsApriori=testDAO.Apriori(((Users)ActionContext.getContext().getSession().get("user")).getName());
			documentsDAO = (DocumentsDAO) context.getBean("documentsDAO");
			documentsDAO.findByLikeName(Id);
			Refresh();
			return "Show";
		}
		else{
			Prompt prompt=new Prompt();
			prompt.JS("alert('超时或为登陆，请先登陆');" +
					"top.location='Index.jsp';");
			return "Login";
		}
	}
	public String AddUser(){
		option="add";
		return "AddUser";
	}
	private void Refresh() {
		// TODO Auto-generated method stub
		List list = documentsDAO.findByLikeName(Id);
		ArrayList arrayList = new ArrayList(list);
		pbDocuments = new pageBean.StagePBDocuments(arrayList, "");
		if (pbDocuments.getPageEndRow() - pbDocuments.getPageStartRow() > 0) {
			if(Page>pbDocuments.totalPages){
				Page=1;
			}
			documents = pbDocuments.getPostPage(Page);
			setDescriptionsip(pbDocuments.getDescriptionsip(Id));
		}
	}
	
	private void setDescriptionsip(String descriptionsip) {
		// TODO Auto-generated method stub
		this.descriptionsip=descriptionsip;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public StagePBDocuments getPbDocuments() {
		return pbDocuments;
	}
	public void setPbDocuments(StagePBDocuments pbDocuments) {
		this.pbDocuments = pbDocuments;
	}
	public int getPage() {
		return Page;
	}
	public void setPage(int page) {
		Page = page;
	}
	public Documents[] getDocuments() {
		return documents;
	}
	public void setDocuments(Documents[] documents) {
		this.documents = documents;
	}
	public String getDescriptionsip() {
		return descriptionsip;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public int getDid() {
		return Did;
	}

	public void setDid(int did) {
		Did = did;
	}
	public Documents[] getDocumentsApriori() {
		return DocumentsApriori;
	}
	public void setDocumentsApriori(Documents[] documentsApriori) {
		DocumentsApriori = documentsApriori;
	}
}
