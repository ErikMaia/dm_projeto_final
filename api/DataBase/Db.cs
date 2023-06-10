using api.Models;
using Microsoft.EntityFrameworkCore;

namespace api.DataBase;
public class Db : DbContext
{
    public DbSet<LocalModel>? Local { get; set; }
    public DbSet<ReservationModel>? Reservation { get; set; }
    public DbSet<TravelModel>? Travel { get; set; }
    public DbSet<UserModel>? Users { get; set; }

    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=sqldata;Database=NOME_DO_BANCO_DE_DADOS;User Id=USUARIO;Password=SENHA;");
    }
}

