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
	String result="";
//	double Confidence=0.9;//默认置信度double Confidence=0.9;//默认置信度
	int NumRules=10;//默认规则条数
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
//				myap.setUpperBoundMinSupport(Confidence);
//				myap.setMinMetric(0.5);
				myap.setOutputItemSets(true);//全部输出
				myap.setCar(false);//设置全局关联规则
				myap.setNumRules(NumRules);//设置规则条数
				myap.buildAssociations(train);
				testDAO.saveResult(myap.toString());//数据库实际输入
				myap.setOutputItemSets(false);
				myap.buildAssociations(train);
				
				result=myap.toString().replaceAll("\n", "<br />").replaceAll("Minimum support", "最小支持度").replaceAll("Minimum metric", "最小置信度");
//				   out.print(myap.toString().replaceAll("\n","<br>")+"<br>");
//
//
//				   File cfile=new File(path,"datamining.txt");
//				   FileWriter wfile=new FileWriter(cfile);
//				   BufferedWriter bcfile=new BufferedWriter(wfile);
//				   bcfile.write(myap.toString());
//				   bcfile.close();
//				   wfile.close();
				prompt.Alert("生成成功");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				prompt.Alert("生成失败，请修改支持度重新生成");
			}
		}
		return "input";
	}
	
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}

//	public double getConfidence() {
//		return Confidence;
//	}
//
//	public void setConfidence(double confidence) {
//		Confidence = confidence;
//	}

	public int getNumRules() {
		return NumRules;
	}

	public void setNumRules(int numRules) {
		NumRules = numRules;
	}

	public String getResult() {
		return result;
	}
}
