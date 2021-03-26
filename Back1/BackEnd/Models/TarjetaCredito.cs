using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class TarjetaCredito
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [Column(TypeName ="varchar(100)")]
        public string Nombre { get; set; }

        [Required]
        [Column(TypeName = "varchar(100)")]
        public string Direccion { get; set; }

        [Required]
        [Column(TypeName = "varchar(100)")]
        public string Telefono { get; set; }

        [Required]
        [Column(TypeName = "varchar(100)")]
        public string Correo { get; set; }

        [Required]
        [Column(TypeName = "varchar(100)")]
        public string MaxRegistros { get; set; }
    }
}
