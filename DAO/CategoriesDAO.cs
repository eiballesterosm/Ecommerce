using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Linq;

namespace DAO
{
    public class CategoriesDAO
    {
        const string storedProcedureName = "[dbo].[sp_Categories]";

        public int CreateCategory(Category category)
        {
            int result = -1;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 1);
                database.AddOutParameter(command, "@pIdReturn", DbType.Int32, 0);
                AddParameters(category, database, command);
                database.ExecuteNonQuery(command);
                result = Convert.ToInt32(database.GetParameterValue(command, "@pIdReturn"));
            }
            catch (Exception exc)
            {
                //Crear Exception
            }

            return result;
        }

        public int UpdateCategory(Category category)
        {
            int result = -1;
            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 4);
                AddParameters(category, database, command);
                result = database.ExecuteNonQuery(command);
            }
            catch (Exception exc)
            {
                //Crear Exception
            }
            return result;
        }

        public int DeleteCategory(Category category)
        {
            int result = -1;
            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 5);
                AddParameters(category, database, command);
                result = database.ExecuteNonQuery(command);
            }
            catch (Exception exc)
            {
                //Crear Exception
            }
            return result;
        }

        public List<Category> GetAllCategories()
        {
            List<Category> listAllCategories = null;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 2);
                DataSet dsAllCategories = database.ExecuteDataSet(command);
                if (dsAllCategories != null && dsAllCategories.Tables.Count > 0)
                {
                    listAllCategories = DAOUtilities.FillEntities<Category>(dsAllCategories.Tables[0]);
                }
            }
            catch (Exception exc)
            {
                //Crear Exception
            }

            return listAllCategories;
        }

        public Category GetCategory(int id)
        {
            Category category = null;

            try
            {
                Database database = DatabaseFactory.CreateDatabase();
                DbCommand command = database.GetStoredProcCommand(storedProcedureName);
                database.AddInParameter(command, "@pOperation", DbType.Int32, 3);
                database.AddInParameter(command, "@pId", DbType.Int32, id);
                DataSet dsAllCategories = database.ExecuteDataSet(command);
                if (dsAllCategories != null && dsAllCategories.Tables.Count > 0)
                {
                    category = DAOUtilities.FillEntities<Category>(dsAllCategories.Tables[0])
                        .FirstOrDefault();
                }
            }
            catch (Exception exc)
            {
                //Crear Exception
            }
            return category;
        }



        private void AddParameters(Category category, Database database, DbCommand command)
        {
            database.AddInParameter(command, "@pId", DbType.Int32, category.id);
            database.AddInParameter(command, "@pName", DbType.String, category.name);
            database.AddInParameter(command, "@pDescription", DbType.String, category.description);
            database.AddParameter(command, "@pIdReturn", DbType.Int32, ParameterDirection.ReturnValue
                , null, DataRowVersion.Default, null);
        }
    }
}
