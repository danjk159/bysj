using System;
using System.Collections.Generic;
using System.Web;
using System.IO;

/// <summary>
///UpLoadAction 的摘要说明
/// </summary>
public class UploadAction:Action
{
    static ISoft.MarketingAndSales.BLL.FlashPaperFiles FlashPaperFilesBLL = new ISoft.MarketingAndSales.BLL.FlashPaperFiles();
    bool b = true;
	public UploadAction()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public override string Name
    {
        get { return "upload"; }
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
            ISoft.MarketingAndSales.Model.FlashPaperFiles FlashPaperFiles = new ISoft.MarketingAndSales.Model.FlashPaperFiles();
            string Title=request["Title"].Split('\'')[1];
            int Type = Convert.ToInt32(request["type"]);
            DateTime Time = DateTime.Now;
            if (Type == 8 || Type == 9)
            {
                FlashPaperFiles = FlashPaperFilesBLL.GetTypeModel(Type);
                if (FlashPaperFiles == null)
                {
                    FlashPaperFiles = new ISoft.MarketingAndSales.Model.FlashPaperFiles();
                    b = false;
                }
            }
            FlashPaperFiles.Title = Title;
            FlashPaperFiles.Type = Type;
            FlashPaperFiles.Author=request.Cookies["username"].Value;
            FlashPaperFiles.PublicDate = Time;
            FlashPaperFiles.VisitorsCount = 0;
            if ((Type == 8 || Type == 9) && b)
            {
                if (!FlashPaperFiles.URL.Equals(""))
                {
                    File.Delete(HttpContext.Current.Server.MapPath("~/Upload/Files/" + FlashPaperFiles.URL));
                }
                FlashPaperFiles.URL = Path.GetFileName(fileName);
                if (!FlashPaperFilesBLL.Update(FlashPaperFiles))
                {
                    ResponseResult("提交", "提交失败！");
                    return;
                }
            }
            else
            {
                FlashPaperFiles.URL = Path.GetFileName(fileName);
                if (FlashPaperFilesBLL.Add(FlashPaperFiles) <= 0)
                {
                    ResponseResult("提交", "提交失败！");
                    return;
                }
            }
        }
    }
}