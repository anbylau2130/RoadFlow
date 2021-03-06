﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebForm.Platform.Home
{
    /// <summary>
    /// MenuRefresh 的摘要说明
    /// </summary>
    public class MenuRefresh : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string roleID = context.Request.QueryString["roleid"];
            string userID = context.Request.QueryString["userid"];
            string refreshID = context.Request.QueryString["refreshid"];
            Guid gid, refreshid, uid;
            if (!roleID.IsGuid(out gid) || !refreshID.IsGuid(out refreshid) || !userID.IsGuid(out uid))
            {
                context.Response.Write("[]");
            }
            else
            {
                context.Response.Write(new RoadFlow.Platform.RoleApp().GetRoleAppRefreshJsonString(gid, uid, refreshid, Common.Tools.BaseUrl));
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}