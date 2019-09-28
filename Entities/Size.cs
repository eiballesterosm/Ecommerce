
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    public class Size
    {
        public int id { get; set; }

        [Required(ErrorMessage = "El Nombre es requerido")]
        [StringLength(10, MinimumLength = 1, ErrorMessage = "La longitud del Nombre no es válida")]
        public string name { get; set; }

        [Required(ErrorMessage = "La Categoría de Talla es requerida")]
        public int categorySizeId { get; set; }

        public string categorySizeName { get; set; }
    }
}
