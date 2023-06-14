using System.ComponentModel.DataAnnotations;

namespace api.Models;

public class TravelModel
{
    [Key]
    public int TravelId { get; set; }
    public DateTime? startDate { get; set; }
    public DateTime? endDate { get; set; }


    [Required]
    public LocalModel? positionDestination { get; set; }

}
