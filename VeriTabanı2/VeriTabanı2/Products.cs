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
    public partial class Products : Form
    {
        public Products()
        {
            InitializeComponent();
        }
        string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec ProductEkle @isim,@kategori,@brand,@modelyear,@listprice", con);
            command.Parameters.AddWithValue("@isim", textBox2.Text);
            command.Parameters.AddWithValue("@kategori", textBox4.Text);
            command.Parameters.AddWithValue("@brand", textBox3.Text);
            command.Parameters.AddWithValue("@modelyear", Convert.ToInt32(textBox5.Text));
            command.Parameters.AddWithValue("@listprice", Convert.ToDecimal(textBox6.Text));
            command.ExecuteNonQuery();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec ProductSil @isim", con);
            command.Parameters.AddWithValue("@isim", textBox2.Text);
            command.ExecuteNonQuery();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec ProductDegistir @isim,@kategori,@brand,@modelyear,@listprice", con);
            command.Parameters.AddWithValue("@isim", textBox2.Text);
            command.Parameters.AddWithValue("@kategori", textBox4.Text);
            command.Parameters.AddWithValue("@brand", textBox3.Text);
            command.Parameters.AddWithValue("@modelyear", Convert.ToInt32(textBox5.Text));
            command.Parameters.AddWithValue("@listprice", Convert.ToDecimal(textBox6.Text));
            command.ExecuteNonQuery();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }
    }
}
