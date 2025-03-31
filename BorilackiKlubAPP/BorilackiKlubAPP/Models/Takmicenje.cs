namespace BorilackiKlubAPP.Models
{
    public class Takmicenje: Entitet
    {
        public string? Naziv { get; set; }
        public DateTime? DatumOdrzavanja { get; set; }
        public string? Vrsta { get; set; }
    }
}
