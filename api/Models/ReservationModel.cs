using System;
using System.ComponentModel.DataAnnotations;

namespace api.Models;

public class ReservationModel
{
    [Key]
    public int? ReservationId { get; set; }
    
    public TravelModel? TravelId { get; set; }

    public UserModel? User { get; set; }
}
