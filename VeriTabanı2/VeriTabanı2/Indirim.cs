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
    public partial class Indirim : Form
    {
        public Indirim()
        {
            InitializeComponent();
        }
        string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
        private void Indirim_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec IndirimliUrunler", con);
            dt.Load(command.ExecuteReader());
            dataGridView1.DataSource = dt;
            con.Close();
        }
    }
}
