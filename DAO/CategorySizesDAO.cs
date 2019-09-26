using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace DAO
{
    public class CategorySizesDAO
    {
        const string storedProcedureName = "[dbo].[sp_CategorySizesDAO]";

        public int CreateCategorySize(CategorySize categorySize)
        {
            int result = -1;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 1);
                database.AddOutParameter(command, "@pIdReturn", DbType.Int32, 0);
                AddParameters(categorySize, database, command);
                database.ExecuteNonQuery(command);
                result = Convert.ToInt32(database.GetParameterValue(command, "@pIdReturn"));
            }
            catch (Exception exc)
            {
                //Crear Exception
            }

            return result;
        }

        public int UpdateCategorySize(CategorySize categorySize)
        {
            int result = -1;
            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 4);
                AddParameters(categorySize, database, command);
                result = database.ExecuteNonQuery(command);
            }
            catch (Exception exc)
            {
                //Crear Exception
            }
            return result;
        }

        public int DeleteCategory(CategorySize categorySize)
        {
            int result = -1;
            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 5);
                AddParameters(categorySize, database, command);
                result = database.ExecuteNonQuery(command);
            }
            catch (Exception exc)
            {
                //Crear Exception
            }
            return result;
        }

        public List<CategorySize> GetAllCategorySizes()
        {
            List<CategorySize> listAllCategories = null;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 2);
                DataSet dsAllCategories = database.ExecuteDataSet(command);
                if (dsAllCategories != null && dsAllCategories.Tables.Count > 0)
                {
                    listAllCategories = DAOUtilities.FillEntities<CategorySize>(dsAllCategories.Tables[0]);
                }
            }
            catch (Exception exc)
            {
                //Crear Exception
            }

            return listAllCategories;
        }

        public CategorySize GetCategorySize(int id)
        {
            CategorySize categorySize = null;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 3);
                database.AddInParameter(command, "@pId", DbType.Int32, id);
                DataSet dsAllCategories = database.ExecuteDataSet(command);
                if (dsAllCategories != null && dsAllCategories.Tables.Count > 0)
                {
                    categorySize = DAOUtilities.FillEntities<CategorySize>(dsAllCategories.Tables[0])
                        .FirstOrDefault();
                }
            }
            catch (Exception exc)
            {
                //Crear Exception
            }
            return categorySize;
        }



        private void AddParameters(CategorySize categorySize, Database database, DbCommand command)
        {
            database.AddInParameter(command, "@pId", DbType.Int32, categorySize.id);
            database.AddInParameter(command, "@pName", DbType.String, categorySize.name);
            database.AddParameter(command, "@pIdReturn", DbType.Int32, ParameterDirection.ReturnValue
                , null, DataRowVersion.Default, null);
        }
    }
}
