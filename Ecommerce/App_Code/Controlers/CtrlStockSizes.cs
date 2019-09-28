using System;
using System.Collections.Generic;
using System.ComponentModel;
using DAO;
using Entities;

/// <summary>
/// Summary description for CtrlBrands
/// </summary>
[DataObject]
public class CtrlStockSizes
{
    public List<StockSize> GetAllStockSizes()
    {
        List<StockSize> stockSizes = new List<StockSize>();
        StockSizesDAO dao = new StockSizesDAO();
        stockSizes = dao.GetAllStockSizes();
        return stockSizes;
    }

    [DataObjectMethod(DataObjectMethodType.Select, false)]
    public List<StockSize> GetAllStockSizes(int productId)
    {
        List<StockSize> stockSizes = new List<StockSize>();
        StockSizesDAO dao = new StockSizesDAO();
        stockSizes = dao.GetAllStockSizes();
        stockSizes = stockSizes.FindAll(ss => ss.productId.Equals(productId));
        return stockSizes;
    }

    [DataObjectMethod(DataObjectMethodType.Insert, false)]
    public void InsertStockSize(int productId, int sizeId, int stock)
    {
        try
        {

        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar el Stock");
        }

        StockSizesDAO dao = new StockSizesDAO();
        List<StockSize> brands = GetAllStockSizes();

        StockSize newStockSize = new StockSize();
        newStockSize.productId = productId;
        newStockSize.sizeId = sizeId;
        newStockSize.stock = stock;
        int result = dao.CreateStockSize(newStockSize);
        if (result < 1)
        {
            throw new Exception("No es posible registrar el Stock");
        }
    }

    [DataObjectMethod(DataObjectMethodType.Update, false)]
    public void UpdateStockSize(int id, int productId, int sizeId, int stock)
    {
        if (id < 1 || productId < 1 || sizeId < 1 || stock < 0)
        {
            throw new Exception("No es posible actualizar el Stock, los valores no son válidos");
        }

        StockSizesDAO dao = new StockSizesDAO();
        StockSize updateStockSize = dao.GetStockSize(id);
        if (updateStockSize != null)
        {
            updateStockSize.productId = productId;
            updateStockSize.sizeId = sizeId;
            updateStockSize.stock = stock;
            int result = dao.UpdateStockSize(updateStockSize);
            if (result < 1)
            {
                throw new Exception("No es posible actualizarel Stock");
            }
        }
        else
        {
            throw new Exception("El id del Stock a actualizar no es válido");
        }
    }


    [DataObjectMethod(DataObjectMethodType.Delete, false)]
    public void DeleteStockSize(int id)
    {
        StockSizesDAO dao = new StockSizesDAO();
        StockSize deleteStockSize = dao.GetStockSize(id);
        if (deleteStockSize != null)
        {
            int result = dao.DeleteStockSize(deleteStockSize);
            if (result < 1)
            {
                throw new Exception("No es posible eliminar el Stock");
            }
        }
        else
        {
            throw new Exception("El id del Stock a eliminar no es válido");
        }
    }
}