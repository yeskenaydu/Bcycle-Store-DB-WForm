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
    public partial class Staff : Form
    {
        public Staff()
        {
            InitializeComponent();
        }
        string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec StaffEkle @1,@2,@3,@4,@5,@6", con);
            command.Parameters.AddWithValue("@1", textBox1.Text);
            command.Parameters.AddWithValue("@2", textBox2.Text);
            command.Parameters.AddWithValue("@4", textBox3.Text);
            command.Parameters.AddWithValue("@3", textBox4.Text);
            command.Parameters.AddWithValue("@5", Convert.ToInt32(textBox5.Text));
            command.Parameters.AddWithValue("@6", Convert.ToInt32(textBox6.Text));
            SqlDataReader r = command.ExecuteReader();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec StaffGuncelle @1,@2,@3,@4,@5,@6", con);
            command.Parameters.AddWithValue("@1", textBox1.Text);
            command.Parameters.AddWithValue("@2", textBox2.Text);
            command.Parameters.AddWithValue("@4", textBox3.Text);
            command.Parameters.AddWithValue("@3", textBox4.Text);
            command.Parameters.AddWithValue("@5", Convert.ToInt32(textBox5.Text));
            command.Parameters.AddWithValue("@6", Convert.ToInt32(textBox6.Text));
            SqlDataReader r = command.ExecuteReader();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec StaffSil @1", con);
            command.Parameters.AddWithValue("@1", textBox4.Text);
            SqlDataReader r = command.ExecuteReader();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void Staff_Load(object sender, EventArgs e)
        {

        }
    }
}
