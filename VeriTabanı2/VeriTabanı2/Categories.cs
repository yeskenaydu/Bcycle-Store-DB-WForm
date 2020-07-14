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
    public partial class Categories : Form
    {
        public Categories()
        {
            InitializeComponent();
        }
        string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec CategoryEkle @isim", con);
            command.Parameters.AddWithValue("@isim", textBox1.Text);
            command.ExecuteNonQuery();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec CategorySil @isim", con);
            command.Parameters.AddWithValue("@isim", textBox1.Text);
            command.ExecuteNonQuery();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec CategoryDegistir @isim,@id", con);
            command.Parameters.AddWithValue("@isim", textBox1.Text);
            command.Parameters.AddWithValue("@id", textBox2.Text);
            command.ExecuteNonQuery();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void Categories_Load(object sender, EventArgs e)
        {

        }
    }
}
