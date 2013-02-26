using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
///LoginAction 的摘要说明
/// </summary>
public class LoginAction : Action
{
	public LoginAction()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public override string Name
    {
        get { return "login"; }
    }

    public override void Process(HttpRequest request, HttpResponse response)
    {
        String name = request.Form["name"];
        String pwd = request.Form["pwd"];
        if (String.IsNullOrEmpty(name))
        {
            ResponseResult("login01","用户名不能为空");
            return;
        }
        if(String.IsNullOrEmpty(pwd))
        {
            ResponseResult("login02","密码不能为空");
            return;
        }
        if (!name.Equals("admin") || !pwd.Equals("admin"))
        {
            ResponseResult("login03", "用户名或密码错误");
        }
        response.AppendCookie(new HttpCookie("username", name));


    }
}