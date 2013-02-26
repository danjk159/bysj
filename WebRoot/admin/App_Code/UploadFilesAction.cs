using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
///UploadFilesAction 的摘要说明
/// </summary>
public class UploadFilesAction : Action
{
    static ISoft.MarketingAndSales.BLL.FlashPaperFiles FlashPaperFilesBLL = new ISoft.MarketingAndSales.BLL.FlashPaperFiles();
    public UploadFilesAction()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    public override string Name
    {
        get { return "uploadfiles"; }
    }

    public override void Process(HttpRequest request, HttpResponse response)
    {
        if (request.Cookies["username"] == null || request.Cookies["username"].Value.Length == 0)
        {
            ResponseResult("common001", "还没登录");
            return;
        }
        foreach (String fileName in request.Files.Keys)
        {
            HttpPostedFile f = request.Files[fileName];
            if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("~/Upload/Files/")))
            {
                System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/Upload/Files/"));
            }
            f.SaveAs(HttpContext.Current.Server.MapPath("~/Upload/Files/" + fileName));
        }
    }
}