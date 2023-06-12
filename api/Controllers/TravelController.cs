using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.DataBase;
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
    public ActionResult Index(){
        return Ok(_context.Travel!.ToList());
    }

    [HttpGet("{id}")]
    public ActionResult Find(int id){
        var travel = _context.Travel!.Find(id);
        if(travel != null)
            return Ok();
        return NotFound();
    }
}