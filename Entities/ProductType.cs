
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    public class ProductType
    {
        public int id { get; set; }

        [Required(ErrorMessage = "El Nombre es requerido")]
        [StringLength(100, MinimumLength = 4, ErrorMessage = "La longitud del Nombre no es válida")]
        public string name { get; set; }

        [Required(ErrorMessage = "La Descripción es requerida")]
        [StringLength(500, MinimumLength = 4, ErrorMessage = "La longitud de la Descripción no es válida")]
        public string description { get; set; }

        [Required(ErrorMessage = "La Categoría es requerida")]
        public int categoryId { get; set; }

        public string categoryName { get; set; }

        [Required(ErrorMessage = "La Categoría de Talla es requerida")]
        public int categorySizeId { get; set; }

        public string categorySizeName { get; set; }
    }
}
