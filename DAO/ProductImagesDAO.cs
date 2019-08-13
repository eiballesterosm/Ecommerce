using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace DAO
{
    public class ProductImagesDAO
    {
        const string storedProcedureName = "[dbo].[sp_ProductImages]";

        public int CreateProductImage(ProductImage productImage)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 1);
                dataBase.AddOutParameter(command, "@pIdReturn", DbType.Int32, 0);
                AddParameters(productImage, dataBase, command);
                dataBase.ExecuteNonQuery(command);
                result = Convert.ToInt32(dataBase.GetParameterValue(command, "@pIdReturn"));
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int UpdateProductImage(ProductImage productImage)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 4);
                AddParameters(productImage, dataBase, command);
                return dataBase.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int DeleteProductImage(int id)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 5);
                dataBase.AddInParameter(command, "@pId", DbType.Int32, id);
                return dataBase.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public List<ProductImage> GetAllProductImages()
        {
            List<ProductImage> listAllProductImages = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 2);
                DataSet dsAllProductImages = dataBase.ExecuteDataSet(command);
                if (dsAllProductImages != null && dsAllProductImages.Tables.Count > 0)
                {
                    listAllProductImages = DAOUtilities.FillEntities<ProductImage>(dsAllProductImages.Tables[0]);
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return listAllProductImages;
        }


        public ProductImage GetProductImage(int id)
        {
            ProductImage ProductImage = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 3);
                dataBase.AddInParameter(command, "@pId", DbType.Int32, id);
                DataSet dsAllProductImages = dataBase.ExecuteDataSet(command);
                if (dsAllProductImages != null && dsAllProductImages.Tables.Count > 0)
                {
                    ProductImage = DAOUtilities
                        .FillEntities<ProductImage>(dsAllProductImages.Tables[0])
                        .FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }

            return ProductImage;
        }


        private void AddParameters(ProductImage ProductImage, Database dataBase, DbCommand command)
        {
            dataBase.AddInParameter(command, "@pId", DbType.Int32, ProductImage.id);
            dataBase.AddInParameter(command, "@pImage", DbType.String, ProductImage.image);
            dataBase.AddInParameter(command, "@pProductId", DbType.Int32, ProductImage.productId);
            dataBase.AddParameter(command, "@pIdReturn", DbType.Int32, ParameterDirection.ReturnValue
                , null, DataRowVersion.Default, null);
        }
    }
}
