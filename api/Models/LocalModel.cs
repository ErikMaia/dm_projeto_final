using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models;

public class LocalModel
{
    [Key]
    public int LocalId { get; set; }
    public string? Name { get; set; }
    public string? Description { get; set; }
    public string? Image { get; set; }

    public List<TravelModel>? LocalTravel { get; set; }
}
