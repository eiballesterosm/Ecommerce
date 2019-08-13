using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;

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
        List<Category> categoryList = GetAllCategories();
        //Category updateCategory = dao.GetCategory(id);
        Category updateCategory = categoryList.Find(c => c.id.Equals(id));
        if (updateCategory != null)
        {
            if (categoryList.FindAll(c => (c.name.ToUpperInvariant().Equals(name.ToUpperInvariant())) && (c.id != id)).Count > 0)
            {
                throw new Exception("Ya existe una categoría con este nombre");
            }

            updateCategory.name = name;
            updateCategory.description = description;
            dao.UpdateCategory(updateCategory);
        }
        else
        {
            throw new Exception("El id de la categoría a actualizar no es válida");
        }
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public void DeleteCategory(int id)
    {
        CategoriesDAO dao = new CategoriesDAO();
        Category updateCategory = dao.GetCategory(id);
        if (updateCategory != null)
        {
            dao.DeleteCategory(updateCategory);
        }
        else
        {
            throw new Exception("El id de la categoría a eliminar no es válida");
        }
    }
}