using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient; 

namespace ConnectToDB01
{
    class Program
    {

        private static string connectionString =
            "Server=ealdb1.eal.local; Database=ejl89_db; User Id =ejl89_usr; Password=Baz1nga89;";

        static void Main(string[] args)
        {
            Program prog = new ConnectToDB01.Program();
            prog.Run();
        }
        private void Run()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    SqlCommand cmd1 = new SqlCommand("InsertUser", con);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.Add(new SqlParameter("FName", "Donald"));
                    cmd1.Parameters.Add(new SqlParameter("LName", "Trump"));
                    cmd1.Parameters.Add(new SqlParameter("Address", "White House"));
                    cmd1.Parameters.Add(new SqlParameter("Zip", "20500"));

                    cmd1.ExecuteNonQuery();

                    SqlCommand cmd2 = new SqlCommand("GetUserByZipCode", con);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.Add(new SqlParameter("@ZipCode", "5000"));

                    SqlDataReader reader = cmd2.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            string id = reader["Id"].ToString();
                            string firstName = reader["FirstName"].ToString();
                            string lastName = reader["LastName"].ToString();
                            string address = reader["Address"].ToString();
                            string zip = reader["Zip"].ToString();
                            Console.WriteLine(firstName + " " + lastName + " " + address + " " + zip);
                        }

                    }

                }
                catch (SqlException e)
                {
                    Console.WriteLine("UPS " + e.Message);
                }
            }

        }

    }
}
