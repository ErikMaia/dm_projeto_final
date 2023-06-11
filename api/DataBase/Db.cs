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
        var serverVersion = new MySqlServerVersion(new Version(8, 0, 31)); // Especifique a versão correta do servidor MySQL aqui

        optionsBuilder.UseMySql("Server=database;Port=3306;Database=tarefas;User=root;Password=tarefas;",
            serverVersion,
            options => options.EnableRetryOnFailure());
    }
}

