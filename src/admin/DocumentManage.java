package admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;

import javax.servlet.http.HttpServlet;

import log.UserLogAdd;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import UploadManage.FileManage;
import check.Prompt;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.DocumentsDAO;
import dao.TestDAO;
import entitys.Documents;
import entitys.Users;

public class DocumentManage extends ActionSupport {
	int Page=1;
	Documents[] documents;
	Documents document;
	Documents[] DocumentsApriori;
	int id;
	String method="search";
	String searchName="";
	String btnSure;
	private File file;
	private String fileFileName;
	private String fileContentType;
	private File image;
	private String imageFileName;
	private String imageContentType;
	Prompt prompt;
	pageBean.PBDocuments pbDocuments;
	InputStream download;
	DocumentsDAO documentsDAO;
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
		documentsDAO = (DocumentsDAO) context.getBean("documentsDAO");
		if(method.equals("search")){
			Refresh();
			return "DocumentManage";
		}else if(method.equals("delete")){
			document = documentsDAO.findById(id);
			if (document != null) {
				FileManage fileManage=new FileManage();
				fileManage.Delete("file",document.getImage());
				fileManage.Delete("file",document.getUd0());
				documentsDAO.delete(document);
				new UserLogAdd(document, 3);
			}
			Refresh();
			return "DocumentManage";
		}else if(method.equals("modify")){
			if (btnSure==null) {
				document = documentsDAO.findById(id);
				new UserLogAdd(document, 5);
				return "DocumentInfo";
			} else {
				if (Verification()) {
					try {
						Update();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Refresh();
					return "DocumentManage";
				}
			}
		}else if(method.equals("add")){
			if (btnSure==null) {
				document = documentsDAO.findById(id);
				return "DocumentInfo";
			} else {
				if (Verification()) {
					try {
						Add();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Refresh();
					return "DocumentManage";
				}
			}
		}else if(method.equals("download")){
			document = documentsDAO.findById(id);
			FileManage fileManage=new FileManage();
			if(document.getUd0()!=null&&document.getUd0().lastIndexOf('.')!=-1){
				this.setFileFileName( document.getName()+document.getUd0().substring(document.getUd0().lastIndexOf('.')));
				this.setDownload(fileManage.DownloadFile(document.getUd0()));
					if(getDownload()==null){
						prompt.Alert("文件失效！");
						Refresh();
						return "DocumentManage";
					}
				new UserLogAdd(document, 4);
				return "Download";
			}else {
				prompt.Alert("文件失效，请重新上传！");
				Refresh();
				return "DocumentManage";
			}
		}else if(method.equals("look")){
			if (btnSure==null) {
			document = documentsDAO.findById(id);
			new UserLogAdd(document, 5);
			document.setViews(document.getViews()+1);
			try {
				Update();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "DocumentInfo";
			}
			else {
				Refresh();
				return "DocumentManage";
			}
		}else if(method.equals("look1")){
			if (btnSure==null) {
				document = documentsDAO.findById(id);
				new UserLogAdd(document, 5);
				document.setViews(document.getViews()+1);
				try {
					Update();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "DocumentInfo";
			}else{
				prompt.JS("history.go(-2)");
				return "Show";
			}
			
		}else if(method.equals("look")){
			if (btnSure==null) {
			document = documentsDAO.findById(id);
			new UserLogAdd(document, 5);
			document.setViews(document.getViews()+1);
			try {
				Update();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "DocumentInfo";
			}
			else {
				Refresh();
				return "DocumentManage";
			}
		}
		return "input";
	}
	private void Add()  throws Exception{
		// TODO Auto-generated method stub
		FileManage fileManage=new FileManage();
		String strfileName=fileManage.SaveFile(file, document.getName(), fileFileName, document.getUd0());
		document.setUd0(strfileName);
		if(this.image!=null){
			String strImageName=fileManage.SaveImage(image,document.getName(),imageFileName,document.getImage());
			document.setImage(strImageName);
		}
		documentsDAO.save(document);
		new UserLogAdd(document, 1);
	}
	
	private void Update() throws Exception {
		// TODO Auto-generated method stub
		FileManage fileManage=new FileManage();
		if(this.file!=null){
			String strfileName=fileManage.SaveFile(file, document.getName(), fileFileName, document.getUd0());
			document.setUd0(strfileName);
		}
		if(this.image!=null){
			String strImageName=fileManage.SaveImage(image,document.getName(),imageFileName,document.getImage());
			document.setImage(strImageName);
		}
		documentsDAO.update(this.document);
		new UserLogAdd(document, 2);
	}

	private boolean Verification() {
		// TODO Auto-generated method stub
		if(method.equals("add")){
			if(document.getName().length()==0){
				this.addFieldError("NameError","文档名不能为空！");
				return false;
			}else if(documentsDAO.findByName(document.getName()).size()!=0){
				this.addFieldError("NameError","文档名已经存在！");
				return false;
			}
			else if(file==null){
				this.addFieldError("NameError","未选择上传文件！");
				return false;
			}
		}
		if(document.getAuthor().length()==0){
			this.addFieldError("AuthorError","作者不能为空！");
			return false;
		}else if(document.getDate()==null){
			this.addFieldError("DateError","日期不能为空！");
			return false;
		}else if(document.getContents().length()==0){
			this.addFieldError("ContentsError","描述不能为空！");
			return false;
		}else if(document.getViews()==null){
			this.addFieldError("ViewsError","浏览次数不能为空！");
			return false;
		}else if(this.image!=null){
	        String suffix =this.imageFileName.substring(this.imageFileName.lastIndexOf('.'));
	        if(!suffix.matches("^.(jpg|gif|png)$")){
	        	this.addFieldError("ImageError","图片格式错误");
	        	return false;
	        }
		}
		return true;
	}

	private void Refresh() {
		// TODO Auto-generated method stub
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		TestDAO testDAO = (TestDAO) context.getBean("testDAO");
		DocumentsApriori=testDAO.Apriori(((Users)ActionContext.getContext().getSession().get("user")).getName());
		List list = documentsDAO.findByLikeName(searchName);
		ArrayList arrayList = new ArrayList(list);
		pbDocuments = new pageBean.PBDocuments(arrayList, "");
		if (pbDocuments.getPageEndRow() - pbDocuments.getPageStartRow() > 0) {
			if(Page>pbDocuments.totalPages){
				Page=1;
			}
			documents = pbDocuments.getPostPage(Page);
			this.setDescriptionsip(pbDocuments.getDescriptionsip(searchName));
		}
	}
	
	@Override
	public void addActionError(String anErrorMessage) {
		// 改从国际化里取值
		if (anErrorMessage
				.startsWith("the request was rejected because its size")) {
			this.addFieldError("ImageError", "文件大小不能超过10M！");
			super.addActionError(getText("struts.multipart.maxSize.limit"));
		} else {
			super.addActionError(anErrorMessage);
		}
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

	public pageBean.PBDocuments getPbDocuments() {
		return pbDocuments;
	}

	public void setPbDocuments(pageBean.PBDocuments pbDocuments) {
		this.pbDocuments = pbDocuments;
	}
	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getBtnSure() {
		return btnSure;
	}

	public void setBtnSure(String btnSure) {
		this.btnSure = btnSure;
	}

	public Documents getDocument() {
		return document;
	}

	public void setDocument(Documents document) {
		this.document = document;
	}
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public InputStream getDownload() {
		return download;
	}
	public void setDownload(InputStream download) {
		this.download = download;
	}
	public String getDescriptionsip() {
		return Descriptionsip;
	}
	public void setDescriptionsip(String descriptionsip) {
		Descriptionsip = descriptionsip;
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
	public Documents[] getDocumentsApriori() {
		return DocumentsApriori;
	}
	public void setDocumentsApriori(Documents[] documentsApriori) {
		DocumentsApriori = documentsApriori;
	}

	
}
