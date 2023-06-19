using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models;

public class TravelModel
{
    [Key]
    public int TravelId { get; set; }
    public DateTime? startDate { get; set; }
    public DateTime? endDate { get; set; }
    public double Price { get; set; }
    
    [ForeignKey("LocalId")]
    public int TravelLocalId { get; set; }
    public LocalModel? positionDestination { get; set; }

    public List<ReservationModel>? Reservations { get; set; }

}
