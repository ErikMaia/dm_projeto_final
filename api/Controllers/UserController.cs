using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.DataBase;
using api.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;
[ApiController]
[Route("api/[controller]")]
public class UserController : ControllerBase
{
    private Db _context;

    public UserController(Db context)
    {
        _context = context;
    }

    [HttpPost("/register")]
    public IActionResult Register(UserDTO user){
        return Ok();
    }

    [HttpPost("/login")]
    public IActionResult Login(UserDTO user){
        return Ok();
    }
}
