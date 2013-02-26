using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
///LogoutAction 的摘要说明
/// </summary>
public class LogoutAction:Action
{
	public LogoutAction()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public override string Name
    {
        get { return "logout"; }
    }

    public override void Process(HttpRequest request, HttpResponse response)
    {
        Session.Remove("username");
    }
}