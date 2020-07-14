using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace VeriTabanı2
{
    public partial class Sales : Form
    {
        public Sales()
        {
            InitializeComponent();
        }
        string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
        private void Sales_Load(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec SalesEkle @1,@2,@3,@4", con);
            command.Parameters.AddWithValue("@1", textBox1.Text);
            command.Parameters.AddWithValue("@2", textBox2.Text);
            command.Parameters.AddWithValue("@3", Convert.ToInt32(textBox3.Text));
            command.Parameters.AddWithValue("@4", Convert.ToDecimal(textBox4.Text));
            SqlDataReader r = command.ExecuteReader();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }
    }
}
