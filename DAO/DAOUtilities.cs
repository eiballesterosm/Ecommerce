using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;

namespace DAO
{
    public class DAOUtilities
    {
        public static List<T> FillEntities<T>(DataTable dataTable) where T : new()
        {
            List<T> returnList = new List<T>();
            foreach (DataRow dataRow in dataTable.Rows)
            {
                returnList.Add(FillEntity<T>(dataRow));
            }
            return returnList;
        }

        public static T FillEntity<T>(DataRow dataRow) where T : new()
        {
            T returnValue = new T();
            foreach (string columnName in dataRow.Table.Columns.Cast<DataColumn>().Select(c => c.ColumnName))
            {
                PropertyInfo propertyInfo = returnValue.GetType().GetProperty(columnName);
                if (propertyInfo != null)
                {
                    if ((propertyInfo.PropertyType.Equals(typeof(int))) || (propertyInfo.PropertyType.Equals(typeof(int?))))
                    {
                        int aux = 0;

                        if (dataRow.IsNull(columnName))
                        {
                            aux = -1;
                        }

                        try
                        {
                            if (aux != -1)
                            {
                                aux = Convert.ToInt32(dataRow[columnName]);
                            }
                            else
                            {
                                aux = 0;
                            }
                        }
                        catch { }
                        finally
                        {
                            propertyInfo.SetValue(returnValue, aux);
                        }
                    }
                    else if (propertyInfo.PropertyType.Equals(typeof(DateTime)))
                    {
                        propertyInfo.SetValue(returnValue, dataRow.IsNull(columnName)
                            ? DateTime.MinValue : Convert.ToDateTime(dataRow[columnName]), null);
                    }
                    else if (propertyInfo.PropertyType.Equals(typeof(DateTime?)))
                    {
                        propertyInfo.SetValue(returnValue, dataRow.IsNull(columnName)
                            ? DateTime.MinValue : Convert.ToDateTime(dataRow[columnName]), null);
                    }
                    else if (propertyInfo.PropertyType.Equals(typeof(string)))
                    {
                        propertyInfo.SetValue(returnValue, dataRow.IsNull(columnName)
                            ? string.Empty : dataRow[columnName].ToString(), null);
                    }
                    else if (propertyInfo.PropertyType.Equals(typeof(decimal)))
                    {
                        propertyInfo.SetValue(returnValue, dataRow.IsNull(columnName)
                            ? 0 : Convert.ToDecimal(dataRow[columnName]), null);
                    }
                    else if (propertyInfo.PropertyType.Equals(typeof(double)))
                    {
                        propertyInfo.SetValue(returnValue, dataRow.IsNull(columnName)
                            ? 0.0 : Convert.ToDouble(dataRow[columnName]), null);
                    }
                    else if (propertyInfo.PropertyType.Equals(typeof(bool)))
                    {
                        propertyInfo.SetValue(returnValue, dataRow.IsNull(columnName)
                            ? false : Convert.ToBoolean(dataRow[columnName]), null);
                    }
                    else if (propertyInfo.PropertyType.Equals(typeof(bool?)))
                    {
                        propertyInfo.SetValue(returnValue, dataRow.IsNull(columnName)
                            ? false : Convert.ToBoolean(dataRow[columnName]), null);
                    }
                }
            }
            return returnValue;
        }
    }
}
