using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.DataBase;
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
        return Ok();
    }

    [HttpPost]
    public ActionResult Create(){
        return Ok();
    }

    [HttpDelete("[controller]/{id}")]
    public ActionResult Delete(int id){
        return Ok();
    }
}
