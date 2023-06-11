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
    [HttpGet]
    public ActionResult Index(){
        var data = _context.Reservation!.ToList();
        return Ok(data);
    }

    [HttpPost]
    public ActionResult Create(ReservationDTO dto){
        var model = new ReservationModel(){
            positionDestination = _context.Local!.Find(dto.positionDestination!.LocalId),
            endDate = dto.endDate,
            positionOrigen = _context.Local!.Find(dto.positionOrigen!.LocalId),
            startDate = dto.startDate,
        };
        _context.Reservation!.Add(model);
        _context.SaveChanges();
        return Ok();
    }

    [HttpDelete("[controller]/{id}")]
    public ActionResult Delete(int id){
        return Ok();
    }
}
