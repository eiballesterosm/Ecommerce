using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace DAO
{
    public class SizesDAO
    {
        const string storedProcedureName = "[dbo].[sp_Sizes]";

        public int CreateSize(Size size)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 1);
                dataBase.AddOutParameter(command, "@pIdReturn", DbType.Int32, 0);
                AddParameters(size, dataBase, command);
                dataBase.ExecuteNonQuery(command);
                result = Convert.ToInt32(dataBase.GetParameterValue(command, "@pIdReturn"));
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int UpdateSize(Size size)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 4);
                AddParameters(size, dataBase, command);
                return dataBase.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int DeleteSize(Size size)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 5);
                AddParameters(size, dataBase, command);
                return dataBase.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public List<Size> GetAllSizes()
        {
            List<Size> listAllSizes = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 2);
                DataSet dsAllSizes = dataBase.ExecuteDataSet(command);
                if (dsAllSizes != null && dsAllSizes.Tables.Count > 0)
                {
                    listAllSizes = DAOUtilities.FillEntities<Size>(dsAllSizes.Tables[0]);
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return listAllSizes;
        }

        public Size GetSize(int id)
        {
            Size size = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 3);
                dataBase.AddInParameter(command, "@pId", DbType.Int32, id);
                DataSet dsAllSizes = dataBase.ExecuteDataSet(command);
                if (dsAllSizes != null && dsAllSizes.Tables.Count > 0)
                {
                    size = DAOUtilities
                        .FillEntities<Size>(dsAllSizes.Tables[0])
                        .FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }

            return size;
        }

        private void AddParameters(Size size, Database dataBase, DbCommand command)
        {
            dataBase.AddInParameter(command, "@pId", DbType.Int32, size.id);
            dataBase.AddInParameter(command, "@pName", DbType.String, size.name);
            dataBase.AddInParameter(command, "@pCategorySizeId", DbType.String, size.categorySizeId);
            dataBase.AddParameter(command, "@pIdReturn", DbType.Int32, ParameterDirection.ReturnValue
                , null, DataRowVersion.Default, null);
        }
    }
}
