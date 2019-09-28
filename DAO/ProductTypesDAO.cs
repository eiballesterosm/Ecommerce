using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace DAO
{
    public class ProductTypesDAO
    {
        const string storedProcedureName = "[dbo].[sp_ProductTypes]";

        public int CreateProductType(ProductType productType)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 1);
                dataBase.AddOutParameter(command, "@pIdReturn", DbType.Int32, 0);
                AddParameters(productType, dataBase, command);
                dataBase.ExecuteNonQuery(command);
                result = Convert.ToInt32(dataBase.GetParameterValue(command, "@pIdReturn"));
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int UpdateProductType(ProductType productType)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 4);
                AddParameters(productType, dataBase, command);
                return dataBase.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int DeleteProductType(ProductType productType)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 5);
                AddParameters(productType, dataBase, command);
                return dataBase.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public List<ProductType> GetAllProductTypes()
        {
            List<ProductType> listAllProductTypes = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 2);
                DataSet dsAllProductTypes = dataBase.ExecuteDataSet(command);
                if (dsAllProductTypes != null && dsAllProductTypes.Tables.Count > 0)
                {
                    listAllProductTypes = DAOUtilities.FillEntities<ProductType>(dsAllProductTypes.Tables[0]);
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return listAllProductTypes;
        }

        public ProductType GetProductType(int id)
        {
            ProductType productType = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 3);
                dataBase.AddInParameter(command, "@pId", DbType.Int32, id);
                DataSet dsAllProductTypes = dataBase.ExecuteDataSet(command);
                if (dsAllProductTypes != null && dsAllProductTypes.Tables.Count > 0)
                {
                    productType = DAOUtilities
                        .FillEntities<ProductType>(dsAllProductTypes.Tables[0])
                        .FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }

            return productType;
        }

        private void AddParameters(ProductType productType, Database dataBase, DbCommand command)
        {
            dataBase.AddInParameter(command, "@pId", DbType.Int32, productType.id);
            dataBase.AddInParameter(command, "@pName", DbType.String, productType.name);
            dataBase.AddInParameter(command, "@pDescription", DbType.String, productType.description);
            dataBase.AddInParameter(command, "@pCategoryId", DbType.String, productType.categoryId);
            dataBase.AddInParameter(command, "@pCategorySizeId", DbType.String, productType.categorySizeId);
            dataBase.AddParameter(command, "@pIdReturn", DbType.Int32, ParameterDirection.ReturnValue
                , null, DataRowVersion.Default, null);
        }
    }
}
