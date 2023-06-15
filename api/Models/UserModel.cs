using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace api.Models;

public class UserModel
{
    [Key]
    public int? UserId { get; set; }
    
    [Required]
    public string? Name { get; set; }
    
    [Required]
    public string? Email { get; set; }
    
    [Required]
    public string? Passwords { get; set; }
    
    [Required]
    public int? Age { get; set; }

    public List<ReservationModel>? Reservations { get; set; }
}
