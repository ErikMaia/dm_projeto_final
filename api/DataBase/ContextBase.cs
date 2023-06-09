using api.Models;
using Microsoft.EntityFrameworkCore;

namespace api.DataBase;
public class ContextBase : DbContext
{
    public DbSet<LocalModel>? Local { get; set; }
    public DbSet<ReservationModel>? Reservation { get; set; }
    public DbSet<TravelModel>? Travel { get; set; }
    public DbSet<UserModel>? Users { get; set; }
}

