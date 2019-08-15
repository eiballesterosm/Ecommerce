using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace DAO
{
    public class BrandsDAO
    {
        const string storedProcedureName = "[dbo].[sp_Brands]";

        public int CreateBrand(Brand brand)
        {
            int result = -1;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 1);
                database.AddOutParameter(command, "@pIdReturn", DbType.Int32, 0);
                AddParameters(brand, database, command);
                database.ExecuteNonQuery(command);
                result = Convert.ToInt32(database.GetParameterValue(command, "@pIdReturn"));
            }
            catch (Exception)
            {
                //Crear Exception
            }

            return result;
        }

        public int UpdateBrand(Brand brand)
        {
            int result = -1;
            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 4);
                AddParameters(brand, database, command);
                result = database.ExecuteNonQuery(command);
            }
            catch (Exception)
            {
                //Crear Exception
            }
            return result;
        }

        public int DeleteBrand(Brand brand)
        {
            int result = -1;
            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 5);
                AddParameters(brand, database, command);
                result = database.ExecuteNonQuery(command);
            }
            catch (Exception)
            {
                //Crear Exception
            }
            return result;
        }

        public List<Brand> GetAllBrands()
        {
            List<Brand> listAllBrands = null;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 2);
                DataSet dsAllBrands = database.ExecuteDataSet(command);
                if (dsAllBrands != null && dsAllBrands.Tables.Count > 0)
                {
                    listAllBrands = DAOUtilities.FillEntities<Brand>(dsAllBrands.Tables[0]);
                }
            }
            catch (Exception ex)
            {
                //Crear Exception
            }

            return listAllBrands;
        }

        public Brand GetBrand(int id)
        {
            Brand brand = null;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 3);
                database.AddInParameter(command, "@pId", DbType.Int32, id);
                DataSet dsAllBrands = database.ExecuteDataSet(command);
                if (dsAllBrands != null && dsAllBrands.Tables.Count > 0)
                {
                    brand = DAOUtilities.FillEntities<Brand>(dsAllBrands.Tables[0])
                        .FirstOrDefault();
                }
            }
            catch (Exception)
            {
                //Crear Exception
            }
            return brand;
        }



        private void AddParameters(Brand brand, Database database, DbCommand command)
        {
            database.AddInParameter(command, "@pId", DbType.Int32, brand.id);
            database.AddInParameter(command, "@pName", DbType.String, brand.name);
            database.AddInParameter(command, "@pDescription", DbType.String, brand.description);
            database.AddParameter(command, "@pIdReturn", DbType.Int32, ParameterDirection.ReturnValue, null, DataRowVersion.Default, null);
        }
    }
}
