using BorilackiKlubAPP.Data;
using BorilackiKlubAPP.Models;
using Microsoft.AspNetCore.Mvc;

namespace BorilackiKlubAPP.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]")]
    public class TakmicenjeController : ControllerBase
    {
        private readonly BorilackiKlubContext _context;

        public TakmicenjeController(BorilackiKlubContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_context.Takmicenja);
        }

        [HttpGet]
        [Route("{sifra:int}")]
        public IActionResult GetBySifra(int sifra)
        {
            return Ok(_context.Takmicenja.Find(sifra));
        }

        [HttpPost]
        public IActionResult Post(Takmicenje takmicenje)
        {
            _context.Takmicenja.Add(takmicenje);
            _context.SaveChanges();
            return StatusCode(StatusCodes.Status201Created, takmicenje);
        }

        [HttpPut]
        [Route("{sifra:int}")]
        [Produces("application/json")]
        public IActionResult Put(int sifra, Takmicenje takmicenje)
        {
            var takmicenjeIzBaze = _context.Takmicenja.Find(sifra);

            // za sada ručno, kasnije Mapper
            takmicenjeIzBaze.Naziv = takmicenje.Naziv;
            takmicenjeIzBaze.DatumOdrzavanja = takmicenje.DatumOdrzavanja;
            takmicenjeIzBaze.Vrsta = takmicenje.Vrsta;

            _context.Takmicenja.Update(takmicenjeIzBaze);
            _context.SaveChanges();

            return Ok(new { poruka = "Uspješno promjenjeno" });

        }

        [HttpDelete]
        [Route("{sifra:int}")]
        [Produces("application/json")]
        public IActionResult Delete(int sifra)
        {
            var takmicenjeIzBaze = _context.Takmicenja.Find(sifra);
            _context.Takmicenja.Remove(takmicenjeIzBaze);
            _context.SaveChanges();
            return Ok(new { poruka = "Uspješno obrisano" });
        }
    }
}
