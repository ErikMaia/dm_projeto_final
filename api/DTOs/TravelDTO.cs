namespace api.DTOs;

public class TravelDTO
{
    public int TravelId { get; set; }
    public DateTime? startDate { get; set; }
    public DateTime? endDate { get; set; }

    public LocalDTO? positionOrigen { get; set; }
    public LocalDTO? positionDestination { get; set; }

}
