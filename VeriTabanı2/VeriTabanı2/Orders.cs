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
    public partial class Orders : Form
    {
        public Orders()
        {
            InitializeComponent();
        }
        string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
        private void Orders_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec OrderEkle @mail,@magaza,@id", con);
            command.Parameters.AddWithValue("@mail", textBox1.Text);
            command.Parameters.AddWithValue("@magaza", textBox2.Text);
            command.Parameters.AddWithValue("@id", Convert.ToInt32(textBox3.Text));
            SqlDataReader r = command.ExecuteReader();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            con.Open();
            SqlCommand command = new SqlCommand("exec OrderSil @mail,@magaza,@id", con);
            command.Parameters.AddWithValue("@mail", textBox1.Text);
            command.Parameters.AddWithValue("@magaza", textBox2.Text);
            command.Parameters.AddWithValue("@id", Convert.ToInt32(textBox3.Text));
            SqlDataReader r = command.ExecuteReader();
            MessageBox.Show("İşlem Tamamlandı!", "Bilgilendirme");
            con.Close();
        }
    }
}
