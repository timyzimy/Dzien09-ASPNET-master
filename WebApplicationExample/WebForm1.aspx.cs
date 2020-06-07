using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationExample
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblInfo.Text = "Nagłówki HTTP<br/>";
            foreach (String key in Request.Headers.AllKeys)
            {
                lblInfo.Text += String.Format("{0} - {1}<br/>", key, Request.Headers[key] );
            }

            lblInfo.Text += "<br/>Metoda HTTP: " + Request.HttpMethod + "<br/>";
            lblInfo.Text += "<br/>URL: " + Request.RawUrl+ "<br/>";
            lblInfo.Text += "<br/>Query string: " + Request.QueryString + "<br/>";

            lblInfo.Text += "Cookies:<br/>";
            foreach (String key in Request.Cookies.AllKeys)
            {
                lblInfo.Text += String.Format("{0} - {1}<br/>", key, Request.Cookies[key].Value);
            }

            if (Page.IsPostBack)
            {
                lblInfo.Text += "<br/>Wystąpił postback";
            }

            if (!Page.IsPostBack)
            {
                tbName.Text = "Wartość domyślna";
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.SetCookie(new HttpCookie("ts", DateTime.Now.ToString()));
        }
    }
}