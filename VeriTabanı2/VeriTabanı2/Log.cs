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
    public partial class Log : Form
    {
        public Log()
        {
            InitializeComponent();
        }
        string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
        public void yenile()
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec LogListele", con);
            dt.Load(command.ExecuteReader());
            dataGridView1.DataSource = dt;
            con.Close();
        }
        private void Log_Load(object sender, EventArgs e)
        {
            yenile();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec LogGir @log", con);
            command.Parameters.AddWithValue("@log", textBox1.Text);
            dt.Load(command.ExecuteReader());
            dataGridView1.DataSource = dt;
            con.Close();
            yenile();
        }
    }
}
