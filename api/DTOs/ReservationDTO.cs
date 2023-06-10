namespace api.DTOs;

public class ReservationDTO
{
    public int? ReservationId { get; set; }
    public DateTime? startDate { get; set; }
    public DateTime? endDate { get; set; }

    public LocalDTO? positionOrigen { get; set; }

    public LocalDTO? positionDestination { get; set; }
}
