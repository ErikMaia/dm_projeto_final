using api.DataBase;
using api.DTOs;
using api.Models;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("[controller]")]
public class ReservationController : ControllerBase
{
    private Db _context;

    public ReservationController(Db context)
    {
        _context = context;
    }
    [HttpGet("{id}")]
    public ActionResult Index(int id)
    {
        var reservation = _context.Reservation!;
        reservation.FirstOrDefault(r => r.Travel!.TravelId != id);

        return Ok(reservation);
    }

    [HttpPost]
    public ActionResult Create(ReservationDTO dto)
    {
        var model = new ReservationModel()
        {
            ReservationId = dto.ReservationId,
            ReservationTravel = dto.ReservationTravel,
            Travel = _context.Travel!.Find(dto.ReservationTravel), // Você pode atribuir o objeto Travel correspondente, se necessário
            ReservationUser = dto.ReservationUser,
            User = _context.Users!.Find(dto.ReservationUser)// Você pode atribuir o objeto User correspondente, se necessário
        };
        _context.Reservation!.Add(model);
        _context.SaveChanges();
        return Ok();
    }

    [HttpGet("{id}/{idReserve}")]
    public IActionResult Find(int id, int idReserve)
    {
        var reservation = _context.Reservation!
            .FirstOrDefault(r =>
                r.User != null &&
                r.User.UserId == id &&
                r.Travel!.TravelId == idReserve
            );
        if (reservation != null)
            return Ok(reservation);
        return NotFound();
    }

    [HttpDelete("{id}")]
    public ActionResult Delete(int id)
    {
        try
        {
            var reserva = _context.Reservation!.Find(id);
            _context.Reservation.Remove(reserva!);
            _context.SaveChanges();
            return Ok();
        }
        catch (Exception)
        {
            return NotFound();
        }
    }
}
