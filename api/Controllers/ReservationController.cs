using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
        var reservation = _context.Reservation!
            .Where<ReservationModel>(res => res.User!.UserId == id)
            .ToList();

        return Ok(reservation);
    }

    [HttpPost]
    public ActionResult Create(ReservationDTO dto)
    {
        var model = new ReservationModel()
        {
            TravelId = _context.Travel!.Find(dto.TravelId!),
            User = _context.Users!.Find(dto.User!.UserId)
        };
        _context.Reservation!.Add(model);
        _context.SaveChanges();
        return Ok();
    }

    [HttpGet("{id}/{idReserve}")]
    public IActionResult Find(int id, int idReserve)
    {
        var reservation = _context.Reservation!.FirstOrDefault(r => r.User != null && r.User.UserId == id && r.TravelId!.TravelId == idReserve);
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
            return Ok();
        }
        catch (Exception)
        {
            return NotFound();
        }
    }
}
