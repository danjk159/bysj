package admin;

import java.io.FileNotFoundException;
import java.io.Reader;

import weka.core.converters.ConverterUtils.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import weka.associations.Apriori;
import weka.core.Instances;

import UploadManage.FileManage;
import check.Prompt;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.CommentaryDAO;
import dao.TestDAO;
import entitys.Users;

public class Procedure extends ActionSupport{
	String method;
	Prompt prompt;
	TestDAO testDAO;
	public  String execute() {
		prompt = new Prompt();
		Users user=(Users)ActionContext.getContext().getSession().get("user");
		if(user==null){
			prompt.JS("alert('超时，请重新登陆');" +
					"top.location='Login.jsp';");
			return "Login";
		}
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		testDAO = (TestDAO) context.getBean("testDAO");
		if(method.equals("apriori")){
			testDAO.save();
			FileManage fileManage=new FileManage();
			try {
				DataSource source=fileManage.readerFile("procedure",method);
				Instances train = source.getDataSet();
				if(train.classIndex() == -1){
					train.setClassIndex(train.numAttributes() - 1);
				}
				Apriori myap=new Apriori();
				myap.setLowerBoundMinSupport(0.1);
				myap.setOutputItemSets(true);
				myap.buildAssociations(train);
				testDAO.saveResult(myap.toString());
//				   out.print(myap.toString().replaceAll("\n","<br>")+"<br>");
//
//
//				   File cfile=new File(path,"datamining.txt");
//				   FileWriter wfile=new FileWriter(cfile);
//				   BufferedWriter bcfile=new BufferedWriter(wfile);
//				   bcfile.write(myap.toString());
//				   bcfile.close();
//				   wfile.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			prompt.Alert("生成成功");
		}
		return "input";
	}
	
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
}
