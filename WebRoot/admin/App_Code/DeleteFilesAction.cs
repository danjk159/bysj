using System;
using System.Collections.Generic;
using System.Web;
using System.IO;

/// <summary>
///DeleteFilesAction 的摘要说明
/// </summary>
public class DeleteFilesAction : Action
{
    static ISoft.MarketingAndSales.BLL.FlashPaperFiles FlashPaperFilesBLL = new ISoft.MarketingAndSales.BLL.FlashPaperFiles();
    public DeleteFilesAction()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    public override string Name
    {
        get { return "deletefiles"; }
    }

    public override void Process(HttpRequest request, HttpResponse response)
    {
        if (request.Cookies["username"] == null || request.Cookies["username"].Value.Length == 0)
        {
            ResponseResult("common001", "还没登录");
            return;
        }
        foreach (String fileName in request["listSwfFile"].Split(','))
        {
            File.Delete(HttpContext.Current.Server.MapPath("~/Upload/Files/" + Path.GetFileName(fileName)));
        }
    }
}