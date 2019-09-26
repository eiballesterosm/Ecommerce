
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    public class CategorySize
    {
        public int id { get; set; }

        [Required(ErrorMessage = "El Nombre es requerido")]
        [StringLength(100, MinimumLength = 4, ErrorMessage = "La longitud del Nombre no es válida")]
        public string name { get; set; }
    }
}
