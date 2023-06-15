using System;

namespace api.DTOs;

public class TravelDTO
{
    public int TravelId { get; set; }
    public DateTime? startDate { get; set; }
    public DateTime? endDate { get; set; }
    public int? positionDestination { get; set; }

}
