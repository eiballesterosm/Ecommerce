
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    public class Color
    {
        public int id { get; set; }

        [Required(ErrorMessage = "El Nombre es requerido")]
        [StringLength(50, MinimumLength = 4, ErrorMessage = "La longitud del Nombre no es válida")]
        public string name { get; set; }


        [Required(ErrorMessage = "El valor del Color es requerido")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "La longitud del valor del Color no es válida")]
        public string color { get; set; }
    }
}
