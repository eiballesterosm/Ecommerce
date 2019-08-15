
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    public class Product
    {
        public int id { get; set; }
        public string sku { get; set; }

        [Required(ErrorMessage = "El Nombre es requerido")]
        [StringLength(100, MinimumLength = 4, ErrorMessage = "La longitud del Nombre no es válida")]
        public string name { get; set; }

        [Required(ErrorMessage = "El Precio es requerido")]
        [StringLength(6, MinimumLength = 4, ErrorMessage = "El Precio no es válido")]
        public string price { get; set; }

        [Required(ErrorMessage = "La Descripción corta es requerida")]
        [StringLength(100, MinimumLength = 4, ErrorMessage = "La longitud de la Descripción corta no es válida")]
        public string shortDescription { get; set; }

        [StringLength(500, ErrorMessage = "La longitud de la Descripción larga no es válida")]
        public string longDescription { get; set; }

        [Required(ErrorMessage = "El Tipo de Producto es requerido")]
        public int productTypeId { get; set; }

        public string productTypeName { get; set; }

        public int stock { get; set; }

        [Required(ErrorMessage = "La Marca es requerida")]
        public int brandId { get; set; }

        public string brandName { get; set; }

        [StringLength(20, ErrorMessage = "La longitud de las Tallas no es válida")]
        public string sizes { get; set; }

        [StringLength(50, ErrorMessage = "La longitud de los Colores no es válida")]
        public string colors { get; set; }
    }

    public class ShoppingCartProduct
    {
        public uint total { get; set; }

        public Product product { get; set; }
    }
}

