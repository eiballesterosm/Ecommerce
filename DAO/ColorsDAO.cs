using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;

namespace DAO
{
    public class ColorDAO
    {
        const string storedProcedureName = "[dbo].[sp_Colors]";

        public int CreateColor(Color color)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 1);
                dataBase.AddOutParameter(command, "@pIdReturn", DbType.Int32, 0);
                AddParameters(color, dataBase, command);
                dataBase.ExecuteNonQuery(command);
                result = Convert.ToInt32(dataBase.GetParameterValue(command, "@pIdReturn"));
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int UpdateColor(Color color)
        {
            int result = -1;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 4);
                AddParameters(color, dataBase, command);
                return dataBase.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return result;
        }

        public int DeleteColor(int id)
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

        public List<Color> GetAllColors()
        {
            List<Color> listAllColors = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 2);
                DataSet dsAllColors = dataBase.ExecuteDataSet(command);
                if (dsAllColors != null && dsAllColors.Tables.Count > 0)
                {
                    listAllColors = DAOUtilities.FillEntities<Color>(dsAllColors.Tables[0]);
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }
            return listAllColors;
        }

        public Color GetColor(int id)
        {
            Color color = null;
            try
            {
                Database dataBase = DatabaseFactory.CreateDatabase();
                DbCommand command = dataBase.GetStoredProcCommand(storedProcedureName);
                dataBase.AddInParameter(command, "@pOperation", DbType.Int32, 3);
                dataBase.AddInParameter(command, "@pId", DbType.Int32, id);
                DataSet dsColor = dataBase.ExecuteDataSet(command);
                if (dsColor != null && dsColor.Tables.Count > 0)
                {
                    color = DAOUtilities
                        .FillEntities<Color>(dsColor.Tables[0])
                        .FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                //Crear Excepcion
            }

            return color;
        }

        private void AddParameters(Color color, Database dataBase, DbCommand command)
        {
            dataBase.AddInParameter(command, "@pId", DbType.Int32, color.id);
            dataBase.AddInParameter(command, "@pName", DbType.String, color.name);
            dataBase.AddInParameter(command, "@pColor", DbType.String, color.color);
            dataBase.AddParameter(command, "@pIdReturn", DbType.Int32, ParameterDirection.ReturnValue
                , null, DataRowVersion.Default, null);
        }
    }
}
