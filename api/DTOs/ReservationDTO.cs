namespace api.DTOs;

public class ReservationDTO
{
    public int? ReservationId { get; set; }
    
    public TravelDTO? TravelId { get; set; }

    public UserDTO? User { get; set; }

}
