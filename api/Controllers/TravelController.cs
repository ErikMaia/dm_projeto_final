using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.DataBase;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;
[ApiController]
[Route("api/[controller]")]
public class TravelController : ControllerBase
{
    private Db _context;

    public TravelController(Db context)
    {
        _context = context;
    }

    [HttpPost]
    public ActionResult Create(){
        return Ok();
    }

    [HttpGet]
    public ActionResult Index(){
        return Ok(_context.Travel!.ToList());
    }
}