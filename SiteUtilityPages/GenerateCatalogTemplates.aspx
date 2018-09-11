<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="log4net" %>
<%@ Import Namespace="Sitecore.Data.Engines" %>
<%@ Import Namespace="Sitecore.Data.Proxies" %>
<%@ Import Namespace="Sitecore.SecurityModel" %>
<%@ Import Namespace="Sitecore.Update" %>
<%@ Import Namespace="Sitecore.Update.Installer" %>
<%@ Import Namespace="Sitecore.Update.Installer.Exceptions" %>
<%@ Import Namespace="Sitecore.Data.Managers" %>
<%@ Import Namespace="Sitecore.Data" %>
<%@ Import Namespace="Sitecore.Publishing" %>
<%@ Import Namespace="Sitecore.Commerce.Engine.Connect.DataProvider.Templates" %>

<%@ Language=C# %>
<HTML>
    <script runat="server" language="C#">
        public void Page_Load(object sender, EventArgs e)
        {
            Response.Write("Catalog template generation started: " + DateTime.Now.ToString("t") + "<br>");

            Sitecore.Context.SetActiveSite("shell");
            using (new SecurityDisabler())
            {
                DateTime publishDate = DateTime.Now;
                Sitecore.Data.Database master = Sitecore.Configuration.Factory.GetDatabase("master");
                var templateGenerator = new CatalogTemplateGenerator();
                templateGenerator.BuildCatalogTemplates(master);
            }

            Response.Write("Catalog template generation completed: " + DateTime.Now.ToString("t") + "<br>");
        }

        protected String GetTime()
        {
            return DateTime.Now.ToString("t");
        }
    </script>
    <body>
        <form id="MyForm" runat="server">
            <div>Catalog templates generated.</div>
	        Current server time is <% =GetTime()%>
        </form>
    </body>
</HTML>