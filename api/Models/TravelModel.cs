using System.ComponentModel.DataAnnotations;

namespace api.Models;

public class TravelModel
{
    [Key]
    public int TravelId { get; set; }
}
