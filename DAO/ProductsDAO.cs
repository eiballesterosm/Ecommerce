using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace DAO
{
    public class ProductsDAO
    {
        const string storedProcedureName = "[dbo].[sp_Products]";

        public int CreateProduct(Product product)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 1);
                dataBase.AddOutParameter(command, "@pIdReturn", DbType.Int32, 0);
                AddParameters(product, dataBase, command);
                dataBase.ExecuteNonQuery(command);
                result = Convert.ToInt32(dataBase.GetParameterValue(command, "@pIdReturn"));
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int UpdateProduct(Product product)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 4);
                AddParameters(product, dataBase, command);
                return dataBase.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int DeleteProduct(Product product)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 5);
                AddParameters(product, dataBase, command);
                return dataBase.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public List<Product> GetAllProducts()
        {
            List<Product> listAllProducts = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 2);
                DataSet dsAllProducts = dataBase.ExecuteDataSet(command);
                if (dsAllProducts != null && dsAllProducts.Tables.Count > 0)
                {
                    listAllProducts = DAOUtilities.FillEntities<Product>(dsAllProducts.Tables[0]);
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return listAllProducts;
        }


        public Product GetProduct(int id)
        {
            Product product = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 3);
                dataBase.AddInParameter(command, "@pId", DbType.Int32, id);
                DataSet dsAllProducts = dataBase.ExecuteDataSet(command);
                if (dsAllProducts != null && dsAllProducts.Tables.Count > 0)
                {
                    product = DAOUtilities
                        .FillEntities<Product>(dsAllProducts.Tables[0])
                        .FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }

            return product;
        }


        private void AddParameters(Product product, Database dataBase, DbCommand command)
        {
            dataBase.AddInParameter(command, "@pId", DbType.Int32, product.id);
            dataBase.AddInParameter(command, "@pName", DbType.String, product.name);
            dataBase.AddInParameter(command, "@pPrice", DbType.Decimal, product.price);
            dataBase.AddInParameter(command, "@pShortDescription", DbType.String, product.shortDescription);
            dataBase.AddInParameter(command, "@pLongDescription", DbType.String, product.longDescription);
            dataBase.AddInParameter(command, "@pProductTypeId", DbType.String, product.productTypeId);
            dataBase.AddInParameter(command, "@pStock", DbType.Int32, product.stock);
            dataBase.AddInParameter(command, "@pBrandId", DbType.Int32, product.brandId);
            dataBase.AddInParameter(command, "@pSizes", DbType.String, product.sizes);
            dataBase.AddInParameter(command, "@pColors", DbType.String, product.colors);
            dataBase.AddParameter(command, "@pIdReturn", DbType.Int32, ParameterDirection.ReturnValue
                , null, DataRowVersion.Default, null);
        }
    }
}
