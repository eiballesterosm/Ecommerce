
namespace Entities
{
    public class Product
    {
        public int id { get; set; }
        public string sku { get; set; }
        public string name { get; set; }
        public string price { get; set; }
        public string shortDescription { get; set; }
        public string longDescription { get; set; }
        public int productTypeId { get; set; }
        public string productTypeName { get; set; }
        public int stock { get; set; }
        public int brandId { get; set; }
        public string brandName { get; set; }
        public string sizes { get; set; }
        public string colors { get; set; }
    }

    public class ShoppingCartProduct
    {
        public uint total { get; set; }

        public Product product { get; set; }
    }
}

