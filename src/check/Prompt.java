package check;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

public class Prompt {
	public Prompt(){
		ServletActionContext.getResponse().setCharacterEncoding("Utf-8");
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
	}
	
	public void Alert(String strAlert) {
		try {
			ServletActionContext
					.getResponse()
					.getWriter()
					.write("<script language='javascript'>"+
							"alert('"+strAlert+"');"+
							"</script>");
			ServletActionContext.getResponse().getWriter().flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void JS(String jsStatement) {
		try {
			ServletActionContext
					.getResponse()
					.getWriter()
					.write("<script language='javascript'>"+
							jsStatement+
							"</script>");
			ServletActionContext.getResponse().getWriter().flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
