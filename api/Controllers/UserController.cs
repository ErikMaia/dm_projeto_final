using api.DataBase;
using api.DTOs;
using api.Models;
using Api.Utils;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;
[ApiController]
[Route("[controller]")]
public class UserController : Controller
{
    private Db _context;

    public UserController(Db context)
    {
        _context = context;
    }

    [HttpPost("register")]
    public ActionResult RegistrarCredentials(UserDTO dto)
    {
        var user = new UserModel()
        {
            UserId = dto.UserId,
            Name = dto.Name,
            Email = dto.Email,
            Passwords = Crypto.criptograph(dto.Passwords!),
            Age = dto.Age
        };

        try
        {
            _context.Users!.Add(user);
            _context.SaveChanges();
            return Ok();
        }
        catch (Exception)
        {
            return BadRequest();
        }
    }

    [HttpPost("login")]
    public ActionResult Login(UserDTO dto)
    {
        string username = dto.Email!; 
        string password = dto.Passwords!;
        var user = _context.Users!.First((u) => u.Email == username && u.Passwords == Crypto.criptograph(password));
        return Ok(user);
    }

    // Restante do código...
}
