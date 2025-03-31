using BorilackiKlubAPP.Models;
using Microsoft.EntityFrameworkCore;

namespace BorilackiKlubAPP.Data
{
    public class BorilackiKlubContext:DbContext
    {

        public BorilackiKlubContext(DbContextOptions<BorilackiKlubContext> opcije): base(opcije) {
        
        }

        public DbSet<Takmicenje> Takmicenja { get; set; }

    }
}
