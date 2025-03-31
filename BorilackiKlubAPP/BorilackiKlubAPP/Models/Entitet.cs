using System.ComponentModel.DataAnnotations;

namespace BorilackiKlubAPP.Models
{
    public abstract class Entitet
    {
        [Key]
        public int Sifra { get; set; }
    }
}
