using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using BookReSearch.Business;
using  System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;
using BookReSearch.Models;

namespace BookReSearch
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Patrons" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Patrons.svc or Patrons.svc.cs at the Solution Explorer and start debugging.
    public class Patrons : IPatrons
    {
        public List<PatronList> ListPatrons()
        {
            DataTable dt = new DataTable();
            dt =  GetDataSet();
            dt.TableName = "PatronList";

            List<PatronList> PatronList = new List<PatronList>();
            PatronList = (from DataRow dr in dt.Rows
                          select new PatronList()
                           {
                               UserName = dr["Username"].ToString(),
                               FirstName = UserProfile.GetUserProfile(dr["Username"].ToString()).FirstName,
                               LastName = UserProfile.GetUserProfile(dr["Username"].ToString()).LastName,
                               Phone = UserProfile.GetUserProfile(dr["Username"].ToString()).Phone
                           }).ToList();

            return PatronList;
        }

        private DataTable GetDataSet()
        {
            SqlConnection sqlConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand sqlcomm = new SqlCommand();
            sqlcomm.Connection = sqlConn;
            using (sqlConn)
            {
                try
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        sqlcomm.CommandText = "sp_PatronList";
                        da.SelectCommand = sqlcomm;
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;

                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        return ds.Tables[0];
                    }
                }
                    
                catch (Exception)
                {
                    return new DataTable(); ;
                }
                finally
                {
                    sqlConn.Close();
                    sqlConn.Dispose();
                }
            }
        }



    }
}
