using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;

/// <summary>
/// Summary description for Utils
/// </summary>
public static class Utils
{
    public static StringLengthAttribute GetLengthAttribute(Type type, string fieldName)
    {
        StringLengthAttribute strLenAttr = null;
        try
        {
            if (type.GetProperty(fieldName) != null)
            {
                strLenAttr = type.GetProperty(fieldName).GetCustomAttributes(typeof(StringLengthAttribute), false).Cast<StringLengthAttribute>().SingleOrDefault();
            }
        }
        catch (Exception)
        {}
        return strLenAttr;
    }

    public static RequiredAttribute GetRequiredAttribute(Type type, string fieldName)
    {
        RequiredAttribute requiredAttr = null;
        try
        {
            if (type.GetProperty(fieldName) != null)
            {
                requiredAttr = type.GetProperty(fieldName).GetCustomAttributes(typeof(RequiredAttribute), false).Cast<RequiredAttribute>().SingleOrDefault();
            }
        }
        catch (Exception)
        { }
        return requiredAttr;
    }

}