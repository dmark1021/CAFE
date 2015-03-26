//------------------------------------------------------------------------------
// All rights are reserved. Reproduction or transmission in whole or in part, in
// any form or by any means, electronic, mechanical or otherwise, is prohibited
// without the prior written consent of the copyright owner.
// Filename: Common.cs
// Copyright © 2010 . WebsiteBuilder.com
//------------------------------------------------------------------------------
using System.Collections;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;


    public class Common
    {
        #region SqlConnection

        /// <summary>
        /// This method gets the connection string.
        /// </summary>
        /// <returns>Connection String</returns>
        private static string GetConnectionString()
        {
            /* This code takes connection string from the web.config file.*/

            string strReturnConnectionString =
                WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            return strReturnConnectionString;
        }


        /// <summary>
        /// This method returns SqlConnection object.
        /// </summary>
        /// <returns>SqlConnection</returns>
        private static SqlConnection GetOleDbConnection()
        {
            string strConnection = GetConnectionString();
            var SqlConnection = new SqlConnection(strConnection);
            return SqlConnection;
        }

        #endregion

        #region EXECUTE DATASET

        /// <summary>
        /// This method returns the data in dataset form. 
        /// </summary>
        /// <param name="commandText">Command text</param>
        /// <returns>Data in the form of Dataset.</returns>
        public static DataSet ExecuteDataSet(string commandText)
        {
            var dsData = new DataSet();
            var myDataAdapter = new SqlDataAdapter(commandText, GetOleDbConnection());
      
            myDataAdapter.Fill(dsData);
            return dsData;
        }


        /// <summary>
        /// This method returns the data in dataset form. 
        /// </summary>
        /// <param name="commandText">Command Text</param>
        /// <param name="htParameters">Hash Table</param>
        /// <returns>Data in the form of Dataset</returns>
        public static DataSet ExecuteDataSet(string commandText, Hashtable htParameters)
        {
            var dsData = new DataSet();
            var myDataAdapter = new SqlDataAdapter();
            var myCommand = new SqlCommand
                                {
                                    Connection = GetOleDbConnection(),
                                    CommandType = CommandType.StoredProcedure,
                                    CommandText = commandText
                                };
            foreach (DictionaryEntry parameter in htParameters)
            {
                myCommand.Parameters.AddWithValue(parameter.Key.ToString(), parameter.Value);
            }

            myDataAdapter.SelectCommand = myCommand;
            myDataAdapter.Fill(dsData);
            return dsData;
        }

        #endregion

        #region EXECUTE SCALAR

        /// <summary>
        /// This method returns object typecast the object to int or string depending upon return type.
        /// </summary>
        /// <param name="commandText"></param>
        /// <returns>Object</returns>
        public static object ExecuteScalar(string commandText)
        {
            SqlConnection SqlConnection = GetOleDbConnection();
            try
            {
                var myCommand = new SqlCommand
                                    {
                                        Connection = SqlConnection,
                                        CommandType = CommandType.StoredProcedure,
                                        CommandText = commandText
                                    };
                SqlConnection.Open();
                object objValue = myCommand.ExecuteScalar();
                return objValue;
            }

            finally
            {
                SqlConnection.Close();
            }
        }


        /// <summary>
        ///  This method returns object typecast the object to int or string depending upon return type.
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="htParameters"></param>
        /// <returns>Object</returns>
        public static object ExecuteScalar(string commandText, Hashtable htParameters)
        {
            SqlConnection SqlConnection = GetOleDbConnection();
            try
            {
                var myCommand = new SqlCommand
                                    {
                                        Connection = SqlConnection,
                                        CommandType = CommandType.StoredProcedure,
                                        CommandText = commandText
                                    };
                foreach (DictionaryEntry parameter in htParameters)
                {
                    myCommand.Parameters.AddWithValue(parameter.Key.ToString(), parameter.Value);
                }
                SqlConnection.Open();
                object objValue = myCommand.ExecuteScalar();
                return objValue;
            }
            finally
            {
                SqlConnection.Close();
            }
        }

        #endregion

        #region EXECUTE NONQUERY

        /// <summary>
        /// This methods returns no of rows affected.
        /// </summary>
        /// <param name="commandText"></param>
        /// <returns>Returns Integer</returns>
        public static int ExecuteNonQuery(string commandText)
        {
            SqlConnection SqlConnection = GetOleDbConnection();
            try
            {
                var myCommand = new SqlCommand
                                    {
                                        Connection = SqlConnection,
                                        CommandType = CommandType.Text,
                                        CommandText = commandText
                                    };
                SqlConnection.Open();
int intRValue = myCommand.ExecuteNonQuery();
                return intRValue;
            }
            finally
            {
                SqlConnection.Close();
            }
        }





        /// <summary>
        /// This methods returns no of rows affected.
        /// </summary>
        /// <param name="commandText"></param>
        /// <returns>Returns Integer</returns>
        public static int ExecuteNonQuery(string commandText, CommandType commandType, Hashtable htParameters)
        {
            SqlConnection SqlConnection = GetOleDbConnection();
            try
            {
                var myCommand = new SqlCommand
                {
                    Connection = SqlConnection,
                    CommandType = commandType,
                    CommandText = commandText
                };
                foreach (DictionaryEntry parameter in htParameters)
                {
                    myCommand.Parameters.AddWithValue(parameter.Key.ToString(), parameter.Value);
                }
                SqlConnection.Open();
                int intRValue = myCommand.ExecuteNonQuery();
                return intRValue;
            }
            finally
            {
                SqlConnection.Close();
            }
        }


       #endregion                                            

        #region EXECUTE READER

        /// <summary>
        ///  This method returns data in form of reader form.
        /// </summary>
        /// <param name="commandText"></param>
        /// <returns>Returns Data Reader</returns>
        public static SqlDataReader ExecuteReader(string commandText)
        {
            SqlConnection SqlConnection = GetOleDbConnection();
            var myCommand = new SqlCommand
                                {
                                    Connection = SqlConnection,
                                    CommandType = CommandType.StoredProcedure,
                                    CommandText = commandText
                                };
            SqlConnection.Open();
            SqlDataReader mySqlDataReader = myCommand.ExecuteReader();
            return mySqlDataReader;
        }


        /// <summary>
        /// This method returns data in form of reader form.
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="htParameters"></param>
        /// <returns>Returns Reader</returns>
        public static SqlDataReader ExecuteReader(string commandText, Hashtable htParameters)
        {
            SqlConnection SqlConnection = GetOleDbConnection();
            var myCommand = new SqlCommand
                                {
                                    Connection = SqlConnection,
                                    CommandType = CommandType.StoredProcedure,
                                    CommandText = commandText
                                };
            foreach (DictionaryEntry parameter  in htParameters)
            {
                myCommand.Parameters.AddWithValue(parameter.Key.ToString(), parameter.Value);
            }

            SqlConnection.Open();
            SqlDataReader mySqlDataReader = myCommand.ExecuteReader();
            return mySqlDataReader;
        }

        #endregion
    }
