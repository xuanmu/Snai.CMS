﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Snai.CMS.Manage.Business.Implement;
using Snai.CMS.Manage.Business.Interface;
using Snai.CMS.Manage.Common.Infrastructure.Extension;
using Snai.CMS.Manage.Common.Infrastructure.Filters;
using Snai.CMS.Manage.Common.Infrastructure.ValidateCodes;
using Snai.CMS.Manage.DataAccess.Base;
using Snai.CMS.Manage.DataAccess.Implement;
using Snai.CMS.Manage.DataAccess.Interface;
using Snai.CMS.Manage.Entities.Settings;

namespace Snai.CMS.Manage
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => false;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(15);
                options.Cookie.HttpOnly = true;
            });

            //services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_3_0);
            services.AddControllersWithViews();

            //注册HttpContext，用于在Controller之外的地方使用
            services.AddHttpContextAccessor();

            //注册数据库连接
            services.AddDbContext<CMSContext>(options => options.UseMySQL(Configuration.GetConnectionString("SnaiCMSConnection")));

            //注册全局配置
            services.AddOptions();
            services.Configure<LogonSettings>(Configuration.GetSection(nameof(LogonSettings)));
            services.Configure<WebSettings>(Configuration.GetSection(nameof(WebSettings)));

            //注册基础工具
            services.AddScoped<HttpContextExtension>();
            services.AddTransient<IValidateCode, ValidateCode_Style1>();
            services.AddTransient<ICMSAdminCookie, CMSAdminCookie>();

            //注册数据库实现
            services.AddScoped<ICMSAdminDao, CMSAdminDao>();

            //注册业务实现
            services.AddScoped<ICMSAdminBO, CMSAdminBO>();

            //注册过滤器
            services.AddScoped<AuthorizationFilter>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();
            app.UseRouting();
            app.UseSession();
            //app.UseRouter(routes =>
            //{
            //    routes.MapRoute(
            //        name: "default",
            //        template: "{controller=Home}/{action=Index}/{id?}");
            //});

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
