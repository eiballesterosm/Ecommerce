using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;

/// <summary>
/// Summary description for CtrlCategories
/// </summary>
[DataObject]
public class CtrlCategorySizes
{
    [DataObjectMethod(DataObjectMethodType.Select, false)]
    public List<CategorySize> GetAllCategorySizes()
    {
        List<CategorySize> categorySizes = new List<CategorySize>();
        CategorySizesDAO dao = new CategorySizesDAO();
        categorySizes = dao.GetAllCategorySizes();
        return categorySizes;
    }

    public CategorySize GetCategorySize(int id)
    {
        CategorySize categorySize = new CategorySize();
        CategorySizesDAO dao = new CategorySizesDAO();
        categorySize = dao.GetCategorySize(id);
        return categorySize;
    }

    [DataObjectMethod(DataObjectMethodType.Insert, false)]
    public void InsertCategorySize(string name)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar la Categoría de Talla");
        }

        CategorySizesDAO dao = new CategorySizesDAO();
        List<CategorySize> categorySizes = GetAllCategorySizes();
        if (categorySizes.FindAll(c => (c.name.ToUpperInvariant().Equals(name.ToUpperInvariant()))).Count > 0)
        {
            throw new Exception("Ya existe una Categoría de Talla con este nombre");
        }

        CategorySize newCategorySize = new CategorySize();
        newCategorySize.name = name;
        int result = dao.CreateCategorySize(newCategorySize);
        if (result < 1)
        {
            throw new Exception("No es posible registrar la Categoría de Talla");
        }
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public void UpdateCategorySize(int id, string name)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar la Categoría de Talla");
        }

        CategorySizesDAO dao = new CategorySizesDAO();
        List<CategorySize> categorySizes = GetAllCategorySizes();
        CategorySize updateCategorySize = categorySizes.Find(c => c.id.Equals(id));
        if (updateCategorySize != null)
        {
            if (categorySizes.FindAll(c => (c.name.ToUpperInvariant().Equals(name.ToUpperInvariant())) && (c.id != id)).Count > 0)
            {
                throw new Exception("Ya existe una Categoría Talla con este nombre");
            }

            updateCategorySize.name = name;

            int result = dao.UpdateCategorySize(updateCategorySize);
            if (result < 1)
            {
                throw new Exception("No es posible actualizar la Categoría de Talla");
            }
        }
        else
        {
            throw new Exception("El id de la Categoría Talla a actualizar no es válido");
        }
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public void DeleteCategorySize(int id)
    {
        CategorySizesDAO dao = new CategorySizesDAO();
        CategorySize deleteCategorySize = dao.GetCategorySize(id);
        if (deleteCategorySize != null)
        {
            int result = dao.DeleteCategorySize(deleteCategorySize);
            if (result < 1)
            {
                throw new Exception("No es posible eliminar la Categoría de Talla, por favor verificar que no existan asociaciones a la Categoría de Talla");
            }
        }
        else
        {
            throw new Exception("El id de la Categoría Talla a eliminar no es válido");
        }
    }
}