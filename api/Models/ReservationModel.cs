using System.ComponentModel.DataAnnotations;

namespace api.Models;

public class ReservationModel
{
    [Key]
    public int? ReservationId { get; set; }
    public DateTime? startDate { get; set; }
    public DateTime? endDate { get; set; }

    [Required]
    public LocalModel? positionOrigen { get; set; }

    [Required]
    public LocalModel? positionDestination { get; set; }

}
