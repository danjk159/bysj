using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;

/// <summary>
///Action 的摘要说明
/// </summary>
public abstract class Action
{
    public abstract String Name
    {
        get;
    }

    public abstract void Process(HttpRequest request, HttpResponse response);

    protected HttpSessionState Session
    {
        get { return HttpContext.Current.Session; }
    }

    protected void ResponseResult(String resultCode, String msg)
    {
        HttpContext.Current.Response.Write(String.Format("ResultCode={0}&ErrorMsg={1}", resultCode, msg));
        HttpContext.Current.Response.End();
    }
    protected void ResponseSuccess()
    {
        ResponseResult("0", "success");
    }


    public void Process(HttpContext context)
    {
        try
        {
            Process(context.Request, context.Response);
            ResponseSuccess();
        }
        catch (System.Threading.ThreadAbortException)
        {
            throw;
        }
        catch (Exception e)
        {
            ResponseResult("action001", e.Message);
        }
    }

}