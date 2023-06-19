using api.DataBase;
using api.DTOs;
using api.Models;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;
[ApiController]
[Route("[controller]")]
public class LocalController : ControllerBase
{
    private Db _context;

    public LocalController(Db context)
    {
        _context = context;
    }

    [HttpGet]
    public ActionResult Index(){
        var Local = _context.Local!.ToList();
        return Ok(Local);
    }

    [HttpGet("{id}")]
    public ActionResult Find(int id){
        var Local = _context.Local!.Find(id);
        if(Local != null)
            return Ok(Local);
        return NotFound();
    }
    [HttpPost]
        public ActionResult Create(LocalDTO dto)
        {
            try
            {      
                var Local = new LocalModel(){
                    Description = dto.Description,
                    Image = dto.Image,
                    LocalTravel = new List<TravelModel>(),
                    Name = dto.Name
                };
                _context.Local!.Add(Local);
                _context.SaveChanges();
                return StatusCode(201);
            }
            catch (Exception){
                return BadRequest();
            }

        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var Local = _context.Local!.Find(id);
            if (Local != null)
            {
                _context.Local.Remove(Local);
                _context.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
}