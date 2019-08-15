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
        try
        {
            name = name.TrimEnd().TrimStart();
            description = description.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar la Categoría");
        }

        CategoriesDAO dao = new CategoriesDAO();
        List<Category> categories = GetAllCategories();
        if (categories.FindAll(c => (c.name.ToUpperInvariant().Equals(name.ToUpperInvariant()))).Count > 0)
        {
            throw new Exception("Ya existe una Categoría con este nombre");
        }

        Category newCategory = new Category();
        newCategory.name = name;
        newCategory.description = description;
        int result = dao.CreateCategory(newCategory);
        if (result < 1)
        {
            throw new Exception("No es posible registrar la Categoría");
        }
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public void UpdateCategory(int id, string name, string description)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            description = description.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar la Categoría");
        }

        CategoriesDAO dao = new CategoriesDAO();
        List<Category> categories = GetAllCategories();
        //Category updateCategory = dao.GetCategory(id);
        Category updateCategory = categories.Find(c => c.id.Equals(id));
        if (updateCategory != null)
        {
            if (categories.FindAll(c => (c.name.ToUpperInvariant().Equals(name.ToUpperInvariant())) && (c.id != id)).Count > 0)
            {
                throw new Exception("Ya existe una Categoría con este nombre");
            }

            updateCategory.name = name;
            updateCategory.description = description;
            int result = dao.UpdateCategory(updateCategory);
            if (result < 1)
            {
                throw new Exception("No es posible actualizar la Categoría");
            }
        }
        else
        {
            throw new Exception("El id de la Categoría a actualizar no es válido");
        }
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public void DeleteCategory(int id)
    {
        CategoriesDAO dao = new CategoriesDAO();
        Category deleteCategory = dao.GetCategory(id);
        if (deleteCategory != null)
        {
            int result = dao.DeleteCategory(deleteCategory);
            if (result < 1)
            {
                throw new Exception("No es posible eliminar la Categoría, por favor verificar que no existan Tipos de Productos asociados a la Categoría");
            }
        }
        else
        {
            throw new Exception("El id de la Categoría a eliminar no es válido");
        }
    }
}