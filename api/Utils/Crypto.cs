using System.Text;
using System.Security.Cryptography;
namespace Api.Utils;
public class Crypto
{
    public static string criptograph(string password)
    {
        byte[] temporaryPassword = toBytes(password);
        byte[] temporaryHash = new MD5CryptoServiceProvider().ComputeHash(temporaryPassword);
        return ByteArrayToString(temporaryHash);
    }
    private static byte[] toBytes(string password)
    {
        return ASCIIEncoding.ASCII.GetBytes(password);
    }
    private static string ByteArrayToString(byte[] arrInput)
    {
        int i;
        StringBuilder sOutput = new StringBuilder(arrInput.Length);
        for (i = 0; i < arrInput.Length; i++)
        {
            sOutput.Append(arrInput[i].ToString("X2"));
        }
        return sOutput.ToString();
    }
    public static bool IsValid(string input, string hash)
    {
        return criptograph(input) == hash;
    }
}
