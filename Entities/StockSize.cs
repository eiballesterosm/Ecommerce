
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    public class StockSize
    {
        public int id { get; set; }

        [Required(ErrorMessage = "El Tipo de Producto es requerido")]
        public int productId { get; set; }

        [Required(ErrorMessage = "La Talla es requerida")]
        public int sizeId { get; set; }

        public string sizeName { get; set; }

        public int stock { get; set; }
    }
}
