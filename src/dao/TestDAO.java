package dao;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import UploadManage.FileManage;

import entitys.Commentary;
import entitys.Documents;

public class TestDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(TestDAO.class);
	public static final String NAME = "name";
	public static final String ID_ = "Id_";

	public void save(){
		log.debug("save");
		try {
			Session session=getSession();
			SQLQuery query=session.createSQLQuery("{Call f5()}");
			List attributeList=query.list();
			query=session.createSQLQuery("{Call f6()}");
			List dataList =query.list();
			FileManage fileManage=new FileManage();
			fileManage.SaveFile("apriori",attributeList,dataList );
			session.close();  
		} catch (Exception e) {
			log.debug(e.toString());
			// TODO: handle exception
		}
	}
	public void saveResult(String strResult) {
		// TODO Auto-generated method stub
		String[] listResult=strResult.split("\n");
		for(int i=0;i<listResult.length;++i)
		{
			int count=0;
			String strList=",";
			String strLinumResult=listResult[i];
			if(strLinumResult.contains("Id_")){
				int j=0;
				while(j<strLinumResult.length()){
					if(strLinumResult.charAt(j)=='_'){
						++j;
						while(strLinumResult.charAt(j)!='='){
							strList+=strLinumResult.charAt(j++);
						}
						++count;
						strList+=",";
					}
					++j;
				}
				if(count>2){
					save(strList);
				}
			}
		}
	}
	private void save(String strList) {
		// TODO Auto-generated method stub
		String sql = "insert into Apriori(Name) values('"+strList+"')"; 
		Session session=getSession();            
		session.createSQLQuery(sql).executeUpdate();
		session.close();
	}
	public Documents[] Apriori(String Name) {
		// TODO Auto-generated method stub
		String sql="select DocumentsId from UserLog where DocumentsId is not null and Name='"+Name+"' order by OperateTime desc";
		String[] strCondition=new String[2];
		Session session=getSession();            
		Query queryObject=session.createSQLQuery(sql);
		if(queryObject.list().size()!=0){
			strCondition[0]=queryObject.list().get(0)+"";
		}
		for(int i = 0; i<queryObject.list().size();++i){
			if(!(queryObject.list().get(i)+"").equals(strCondition[0])){
				strCondition[1]=queryObject.list().get(i)+"";
				break;
			}
		}
		sql = "select Name from Apriori where Name like '%,"+strCondition[0]+",%' and Name like '%,"+strCondition[1]+",%' order by Id desc "; 
		queryObject=session.createSQLQuery(sql);
		if(queryObject.list().size()>2){
			String strDocumentsId= queryObject.list().get(0)+"";
			strDocumentsId=strDocumentsId.replace(","+strCondition[0], "");
			strDocumentsId=strDocumentsId.replace(","+strCondition[1], "");
			String[] str=strDocumentsId.split(",");
			Documents[] documents=new Documents[str.length-1];
			ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
					"applicationContext.xml");
			DocumentsDAO documentsDAO = (DocumentsDAO) context.getBean("documentsDAO");
			
			for(int i=1;i<str.length;++i){
				documents[i-1]=documentsDAO.findById(Integer.valueOf(str[i]));
			}
			session.close();
			return documents;
		}
		else{
			return null;
		}
	}

}
