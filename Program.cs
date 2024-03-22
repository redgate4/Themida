// See https://aka.ms/new-console-template for more information

using System.Runtime.InteropServices;
using ExampleAotApp;

Console.WriteLine("Please enter password #1:");
var password = Console.ReadLine();
var passwordPtr = Marshal.StringToHGlobalUni(password);
if (NativeImports.CheckPassword(passwordPtr))
{
    Console.WriteLine("Password #1 is correct");
}
else
{
    Console.WriteLine("Password #1 is incorrect");
}

Console.WriteLine("Please enter password #2:");
var password2 = Console.ReadLine();
var password2Ptr = Marshal.StringToHGlobalUni(password2);
if (NativeImports.CheckPassword2(password2Ptr))
{
    Console.WriteLine("Password #2 is correct");
}
else
{
    Console.WriteLine("Password #2 is incorrect");
}
