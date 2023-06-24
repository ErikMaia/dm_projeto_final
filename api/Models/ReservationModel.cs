using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models;

public class ReservationModel
{
    [Key]
    public int? ReservationId { get; set; }

    [ForeignKey("TravelId")]
    public int ReservationTravel { get; set; }
    public TravelModel? Travel { get; set; }

    [ForeignKey("UserId")]
    public int ReservationUser { get; set; }
    public UserModel? User { get; set; }
}
