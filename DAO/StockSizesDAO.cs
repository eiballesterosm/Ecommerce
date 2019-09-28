using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace DAO
{
    public class StockSizesDAO
    {
        const string storedProcedureName = "[dbo].[sp_StockSizes]";

        public int CreateStockSize(StockSize stockSize)
        {
            int result = -1;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 1);
                database.AddOutParameter(command, "@pIdReturn", DbType.Int32, 0);
                AddParameters(stockSize, database, command);
                database.ExecuteNonQuery(command);
                result = Convert.ToInt32(database.GetParameterValue(command, "@pIdReturn"));
            }
            catch (Exception)
            {
                //Crear Exception
            }

            return result;
        }

        public int UpdateStockSize(StockSize stockSize)
        {
            int result = -1;
            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 4);
                AddParameters(stockSize, database, command);
                result = database.ExecuteNonQuery(command);
            }
            catch (Exception)
            {
                //Crear Exception
            }
            return result;
        }

        public int DeleteStockSize(StockSize stockSize)
        {
            int result = -1;
            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 5);
                AddParameters(stockSize, database, command);
                result = database.ExecuteNonQuery(command);
            }
            catch (Exception)
            {
                //Crear Exception
            }
            return result;
        }

        public List<StockSize> GetAllStockSizes()
        {
            List<StockSize> listAllStockSizes = null;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 2);
                DataSet dsAllStockSizes = database.ExecuteDataSet(command);
                if (dsAllStockSizes != null && dsAllStockSizes.Tables.Count > 0)
                {
                    listAllStockSizes = DAOUtilities.FillEntities<StockSize>(dsAllStockSizes.Tables[0]);
                }
            }
            catch (Exception ex)
            {
                //Crear Exception
            }

            return listAllStockSizes;
        }

        public StockSize GetStockSize(int id)
        {
            StockSize stockSize = null;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 3);
                database.AddInParameter(command, "@pId", DbType.Int32, id);
                DataSet dsStockSize = database.ExecuteDataSet(command);
                if (dsStockSize != null && dsStockSize.Tables.Count > 0)
                {
                    stockSize = DAOUtilities.FillEntities<StockSize>(dsStockSize.Tables[0])
                        .FirstOrDefault();
                }
            }
            catch (Exception)
            {
                //Crear Exception
            }
            return stockSize;
        }



        private void AddParameters(StockSize stockSize, Database database, DbCommand command)
        {
            database.AddInParameter(command, "@pId", DbType.Int32, stockSize.id);
            database.AddInParameter(command, "@pProductId", DbType.Int32, stockSize.productId);
            database.AddInParameter(command, "@pSizeId", DbType.Int32, stockSize.sizeId);
            database.AddInParameter(command, "@pStock", DbType.Int32, stockSize.stock);
            database.AddParameter(command, "@pIdReturn", DbType.Int32, ParameterDirection.ReturnValue, null, DataRowVersion.Default, null);
        }
    }
}
