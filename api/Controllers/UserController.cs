using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using api.DataBase;
using api.DTOs;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers;
public class UserController : Controller
{
    // Dicionário para armazenar os usuários registrados
    private Db _context;

    public UserController(Db context)
    {
        _context = context;
    }

    private static Dictionary<string, string> usuarios_registrados = new Dictionary<string, string>();

    [HttpPost("/user/reservation")]
    public ActionResult Registrar(UserDTO dto)
    {

        return Ok();
    }

    [HttpPost("/user/reservation")]
    public ActionResult Registrar(string username, string password)
    {
        // Criptografa a senha usando o algoritmo SHA-256
        string hashedPassword = HashSenha(password);

        // Armazena o nome de usuário e a senha criptografada no dicionário de usuários registrados
        usuarios_registrados[username] = hashedPassword;

        ViewBag.Message = "Usuário registrado com sucesso!";
        return Ok();
    }

    [HttpPost("/user/login")]
    public ActionResult Login(string username, string password)
    {
        // Verifica se o nome de usuário existe e se a senha corresponde à senha registrada
        if (usuarios_registrados.ContainsKey(username))
        {
            string hashedPassword = HashSenha(password);
            if (hashedPassword == usuarios_registrados[username])
            {
                ViewBag.Message = "Login bem-sucedido!";
            }
            else
            {
                ViewBag.Message = "Senha incorreta.";
            }
        }
        else
        {
            ViewBag.Message = "Usuário não encontrado.";
        }

        return Ok();
    }

    private string HashSenha(string senha)
    {
        // Criptografa a senha usando o algoritmo SHA-256
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] bytes = Encoding.UTF8.GetBytes(senha);
            byte[] hashBytes = sha256.ComputeHash(bytes);

            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                builder.Append(hashBytes[i].ToString("x2")); // Converte o byte em uma string hexadecimal
            }
            return builder.ToString();
        }
    }
}

