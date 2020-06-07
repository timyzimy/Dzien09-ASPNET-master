using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationExample
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        List<City> cities = new List<City>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Cache["lista"]==null)
            {
                cities.Add(new City(1, "Gdańsk"));
                cities.Add(new City(2, "Kraków"));
                cities.Add(new City(3, "Warszawa"));
                cities.Add(new City(4, "Poznań"));
                Cache.Add("lista", cities, null,
                    System.Web.Caching.Cache.NoAbsoluteExpiration,
                    new TimeSpan(0, 30, 0), System.Web.Caching.CacheItemPriority.Default, null);
            } else
            {
                cities = (List<City>)Cache["lista"];
            }
            

            int dd1 = -1;
            if (Page.IsPostBack)
            {
                dd1 = DropDownList1.SelectedIndex;
            }
            DropDownList1.DataSource = cities;
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();
            if (Page.IsPostBack)
            {
                DropDownList1.SelectedIndex = dd1;
            }


            if (Page.IsPostBack)
            {
                //odczyt danych z formularza
                StringBuilder sb = new StringBuilder();
                sb.Append("checkbox = " + CheckBox1.Checked.ToString() + "<br/>");
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    if (item.Selected)
                    {
                        sb.Append("checkbox list = " + item.Value + "<br/>");
                    }
                }

                sb.Append("textbox = " + TextBox1.Text + "<br/>");
                sb.Append("drop down 1 = " + DropDownList1.SelectedValue + "<br/>");
                sb.Append("drop down 2 = " + DropDownList2.SelectedValue + "<br/>");
                sb.Append("list box = " + ListBox1.SelectedItem.Value + "<br/>");
                sb.Append("radio button list = " + RadioButtonList1.SelectedItem.Value + "<br/>");

                Label1.Text = sb.ToString();
            }
        }
    }
}