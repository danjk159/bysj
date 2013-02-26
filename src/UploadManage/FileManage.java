package UploadManage;

import java.io.BufferedReader;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import weka.core.converters.ConverterUtils.DataSource;


public class FileManage {
    
	@SuppressWarnings("deprecation")
	String UploadRoot = ServletActionContext.getRequest().getRealPath("/upload");
    public String SaveImage(File image,String documentImageName,String uploadImageName,String oldImageName) throws Exception {
		// TODO Auto-generated method stub

		Delete("image",oldImageName);
		String suffix =uploadImageName.substring(uploadImageName.lastIndexOf('.'));
	    String fName=documentImageName+suffix;
		return Save("image",fName,image);
	}
    
	public String SaveFile(File file,String documentFileName,String uploadFileName,String oldFileName) throws Exception{
		// TODO Auto-generated method stub
        Delete("file",oldFileName);
        String suffix =uploadFileName.substring(uploadFileName.lastIndexOf('.'));
        String fName=documentFileName+suffix;
        return Save("file",fName,file);
	}
	//关联规则的文件生成方法
	public Boolean SaveFile(String method,List attributeList,List dataList) throws Exception{
		// TODO Auto-generated method stub
        Delete("procedure",method+".arff");
        String root=UploadRoot+"/procedure/";
        DataOutputStream out=new DataOutputStream(new FileOutputStream(root+"/"+method+".arff"));
        String strAttribute=new String();
        strAttribute+="@relation "+method+"\n";
        for(int i=1;i<attributeList.size();++i){
        strAttribute+="@attribute "+attributeList.get(i).toString()+" {0,1}\n";
        }
        strAttribute+="@data\n";
        for(int i=0;i<dataList.size();++i){
        	Object[] list= (Object[]) dataList.get(i);
        	for(int j=1;j<list.length;++j){
        		strAttribute+=list[j].toString()+",";
        	}
        	strAttribute=strAttribute.substring(0, strAttribute.length()-1)+"\n";
        }
        out.writeBytes(strAttribute);
        return true;
	}
    private String Save(String dirName, String fName,File file) throws Exception {
		// TODO Auto-generated method stub
    	String root=UploadRoot+"/"+dirName;
		InputStream is = new FileInputStream(file);
        File destFile = new File(root,fName);
        OutputStream os = new FileOutputStream(destFile);
        byte[] buffer = new byte[400];
        int length = 0 ;
        while((length = is.read(buffer)) > 0){
            os.write(buffer, 0, length);
        }
        is.close();
        os.close();
        return "/upload/"+dirName+"/"+fName;
	}
	public void Delete(String dirName, String FileName) {
		// TODO Auto-generated method stub
		String root=UploadRoot+"/"+dirName;
		File dir = new File(root);
		if(!dir.exists()){
			dir.mkdirs();
		}
		if(FileName.trim().length()!=0){
			File file = new File(root,FileName);
			if(file.exists()){
				file.delete();
			}
		}
	}

	public InputStream DownloadFile(String fileUrl) {
		// TODO Auto-generated method stub
		String filePath= ServletActionContext.getRequest().getRealPath(fileUrl);
		File file = new File(filePath);  
		try {
			InputStream is = new FileInputStream(file);
			System.out.println(is);
			if(is!=null){
				return is;
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}

	public DataSource readerFile(String dirName, String method) throws Exception {
		// TODO Auto-generated method stub
		return new DataSource(UploadRoot+"/"+dirName+"/"+method+".arff");
	}
}
