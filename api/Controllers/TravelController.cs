using api.DataBase;
using api.DTOs;
using api.Models;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;
[ApiController]
[Route("[controller]")]
public class TravelController : ControllerBase
{
    private Db _context;
    public TravelController(Db context)
    {
        _context = context;
    }

    [HttpGet]
    public ActionResult Index()
    {
        var travel = _context.Travel!.ToList();
        return Ok(travel);
    }

    [HttpGet("{id}")]
    public ActionResult Find(int id)
    {
        var travel = _context.Travel!.Find(id);
        if (travel != null)
            return Ok(travel);
        return NotFound();
    }
    [HttpPost]
    public ActionResult Create(TravelDTO dto)
    {
        try
        {
            var travel = new TravelModel()
            {
                TravelLocalId = (int)dto.positionDestination!,
                endDate = dto.endDate,
                positionDestination = _context.Local!.Find(dto.positionDestination),
                startDate = dto.startDate,
                Price = 2000
            };
            _context.Travel!.Add(travel);
            _context.SaveChanges();
            return StatusCode(201);
        }
        catch (Exception)
        {
            return BadRequest();
        }

    }

    [HttpDelete("{id}")]
    public ActionResult Delete(int id)
    {
        var travel = _context.Travel!.Find(id);
        if (travel != null)
        {
            _context.Travel.Remove(travel);
            _context.SaveChanges();
            return NoContent();
        }
        return NotFound();
    }
}