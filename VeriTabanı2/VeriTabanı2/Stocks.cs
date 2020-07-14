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
    public partial class Stocks : Form
    {
        public Stocks()
        {
            InitializeComponent();
        }
        string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec StocksEkle @magaza,@urun,@adet", con);
            command.Parameters.AddWithValue("@magaza", textBox1.Text);
            command.Parameters.AddWithValue("@urun", textBox2.Text);
            command.Parameters.AddWithValue("@adet", Convert.ToInt32(textBox3.Text));
            SqlDataReader r = command.ExecuteReader();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void Stocks_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec StocksSil @magaza,@urun", con);
            command.Parameters.AddWithValue("@magaza", textBox1.Text);
            command.Parameters.AddWithValue("@urun", textBox2.Text);
            SqlDataReader r = command.ExecuteReader();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec StocksGuncelle @magaza,@urun,@adet", con);
            command.Parameters.AddWithValue("@magaza", textBox1.Text);
            command.Parameters.AddWithValue("@urun", textBox2.Text);
            command.Parameters.AddWithValue("@adet", Convert.ToInt32(textBox3.Text));
            SqlDataReader r = command.ExecuteReader();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }
    }
}
