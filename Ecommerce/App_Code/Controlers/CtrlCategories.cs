using System.Collections.Generic;
using System.ComponentModel;
using DAO;
using Entities;

/// <summary>
/// Summary description for CtrlCategories
/// </summary>
[DataObject]
public class CtrlCategories
{
    [DataObjectMethod(DataObjectMethodType.Select, false)]
    public List<Category> GetAllCategories()
    {
        List<Category> categories = new List<Category>();
        CategoriesDAO dao = new CategoriesDAO();
        categories = dao.GetAllCategories();
        return categories;
    }

    [DataObjectMethod(DataObjectMethodType.Insert, false)]
    public void InsertCategory(string name, string description)
    {
        CategoriesDAO dao = new CategoriesDAO();
        Category newCategory = new Category();
        newCategory.name = name;
        newCategory.description = description;
        dao.CreateCategory(newCategory);
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public void UpdateCategory(int id, string name, string description)
    {
        CategoriesDAO dao = new CategoriesDAO();
        Category updateCategory = dao.GetCategory(id);
        if (updateCategory != null)
        {
            updateCategory.name = name;
            updateCategory.description = description;
            dao.UpdateCategory(updateCategory);
        }
    }
}