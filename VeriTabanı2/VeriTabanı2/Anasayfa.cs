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
    public partial class Anasayfa : Form
    {
        public Anasayfa()
        {
            InitializeComponent();
        }
        string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
        
        private void Form1_Load(object sender, EventArgs e)
        {
            //string connectionString = "Data Source=DESKTOP-B7GV4JV\\SQLEXPRESS;Initial Catalog=Bike Stores;Integrated Security=True";
            //SqlConnection con = new SqlConnection(connectionString);
            //DataTable dt = new DataTable();
            //con.Open();
            //SqlCommand command = new SqlCommand("exec CandidateListele", con);
            //dt.Load(command.ExecuteReader());
            //con.Close();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            DataTable dt = new DataTable();

            if(comboBox1.SelectedIndex==0)
            {
                SqlCommand command = new SqlCommand("exec BrandListele",con);
                con.Open();
                dt.Load(command.ExecuteReader());
                con.Close();
                dataGridView1.DataSource = dt;
                
            }

            else if(comboBox1.SelectedIndex==1)
            {
                SqlCommand command = new SqlCommand("exec CategoryListele", con);
                con.Open();
                dt.Load(command.ExecuteReader());
                con.Close();
                dataGridView1.DataSource = dt;
            }

            else if (comboBox1.SelectedIndex == 2)
            {
                SqlCommand command = new SqlCommand("exec ProductListele", con);
                con.Open();
                dt.Load(command.ExecuteReader());
                con.Close();
                dataGridView1.DataSource = dt;
            }

            else if (comboBox1.SelectedIndex == 3)
            {
                SqlCommand command = new SqlCommand("exec StockListele", con);
                con.Open();
                dt.Load(command.ExecuteReader());
                con.Close();
                dataGridView1.DataSource = dt;
            }

            else if (comboBox1.SelectedIndex == 4)
            {
                SqlCommand command = new SqlCommand("exec CustomerListele", con);
                con.Open();
                dt.Load(command.ExecuteReader());
                con.Close();
                dataGridView1.DataSource = dt;
            }

            else if (comboBox1.SelectedIndex == 5)
            {
                SqlCommand command = new SqlCommand("exec OrderListele", con);
                con.Open();
                dt.Load(command.ExecuteReader());
                con.Close();
                dataGridView1.DataSource = dt;
            }

            else if (comboBox1.SelectedIndex == 6)
            {
                SqlCommand command = new SqlCommand("exec SalesListele", con);
                con.Open();
                dt.Load(command.ExecuteReader());
                con.Close();
                dataGridView1.DataSource = dt;
            }

            else if (comboBox1.SelectedIndex == 7)
            {
                SqlCommand command = new SqlCommand("exec StaffListele", con);
                con.Open();
                dt.Load(command.ExecuteReader());
                con.Close();
                dataGridView1.DataSource = dt;
            }

            else if (comboBox1.SelectedIndex == 8)
            {
                SqlCommand command = new SqlCommand("exec StoreListele", con);
                con.Open();
                dt.Load(command.ExecuteReader());
                con.Close();
                dataGridView1.DataSource = dt;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(comboBox1.SelectedIndex==0)
            {
                Brands br = new Brands();
                br.Show();
            }
            else if(comboBox1.SelectedIndex==1)
            {
                Categories c = new Categories();
                c.Show();
            }
            else if (comboBox1.SelectedIndex == 2)
            {
                Products p = new Products();
                p.Show();
            }
            else if (comboBox1.SelectedIndex == 3)
            {
                Stocks s = new Stocks();
                s.Show();
            }
            else if (comboBox1.SelectedIndex == 4)
            {
                Customers s = new Customers();
                s.Show();
            }
            else if (comboBox1.SelectedIndex == 5)
            {
                Orders s = new Orders();
                s.Show();
            }
            else if (comboBox1.SelectedIndex == 6)
            {
                Sales s = new Sales();
                s.Show();
            }
            else if (comboBox1.SelectedIndex == 7)
            {
                Staff s = new Staff();
                s.Show();
            }
            else if (comboBox1.SelectedIndex == 8)
            {
                Stores s = new Stores();
                s.Show();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Log l = new Log();
            l.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Indirim i = new Indirim();
            i.Show();
        }
    }
}
