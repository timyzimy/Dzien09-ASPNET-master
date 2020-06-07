using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyDoctor
{
    public partial class RegisterVisit2 : System.Web.UI.Page
    {
        VisitData data = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                data = Session["RegForm"] as VisitData;
                if (data == null) throw new Exception();
                lblDescr.Text = data.FirstName + " " + data.LastName;
            } catch (Exception exc)
            {
                Server.Transfer("~/RegisterVisit.aspx");
            }

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            bool isOK = true;
            String filename = null;

            if (fuImage.HasFile)
            {
                // image/jpg image/jpeg text/plain
                if (fuImage.PostedFile.ContentType=="image/png")
                {
                    if (fuImage.PostedFile.ContentLength < 500000)
                    {
                        //upload do wskazanego folderu na serwerze                        
                        filename =  Guid.NewGuid().ToString("N") + "-"+ Path.GetFileName(fuImage.FileName);
                        fuImage.SaveAs(Server.MapPath("~/uploads/")+filename);
                        filename = "~/uploads/" + filename;
                        lblResult.Text = "Wszystko OK";
                        lblResult.ForeColor = Color.Black;
                    }
                    else
                    {
                        lblResult.Text = "Plik za duży";
                        lblResult.ForeColor = Color.Red;
                        isOK = false;                         
                    }
                } else
                {
                    lblResult.Text = "Plik w niepoprawnym formacie";
                    lblResult.ForeColor = Color.Red;
                    isOK = false;
                }
            }

            if (isOK)
            {
                String cs = "Server=127.0.0.1;Port=3306;Database=edoctor;Uid=root;Pwd=root";

                //zapis do bazy
                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    conn.Open();
                    String sql = @"
                        INSERT INTO visits
                        (fname, lname, pesel, email, doctor, visit_date, descr, image, card)
                        VALUES
                        (@fname, @lname, @pesel, @email, @doctor, @visit_date, @descr, @image, @card)
                    ";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.Add("@fname", MySqlDbType.VarChar, 50).Value = data.FirstName;
                    cmd.Parameters.Add("@lname", MySqlDbType.VarChar, 50).Value = data.LastName;
                    cmd.Parameters.Add("@pesel", MySqlDbType.VarChar, 20).Value = data.PESEL;
                    cmd.Parameters.Add("@email", MySqlDbType.VarChar, 50).Value = data.Email;
                    cmd.Parameters.Add("@doctor", MySqlDbType.Int32).Value = data.DoctorId;
                    cmd.Parameters.Add("@visit_date", MySqlDbType.Date).Value = data.DateVisit;
                    cmd.Parameters.Add("@descr", MySqlDbType.Text).Value = tbDescr.Text;
                    cmd.Parameters.Add("@card", MySqlDbType.VarChar, 10).Value = data.CardNumber;
                    cmd.Parameters.Add("@image", MySqlDbType.VarChar, 1024).Value = null;
                    if (!String.IsNullOrEmpty(filename))
                    {
                        cmd.Parameters["@image"].Value = filename;
                    }
                    cmd.ExecuteNonQuery();
                    btnOK.Enabled = false;
                    lblResult.Text = "Dziękujemy za zgłoszenie";
                    Session["RegForm"] = null;
                }

            }
        }
    }
}