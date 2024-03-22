using System.Runtime.InteropServices;

namespace NativeAotLib;

public static class Security
{
    [UnmanagedCallersOnly(EntryPoint = "CheckPassword")]
    public static bool CheckPassword(IntPtr passwordPtr)
    {
        SecureEngineSDK.VM_TIGER_WHITE_START();
        var password = Marshal.PtrToStringUni(passwordPtr);
        var result = password == "testpassword";

        int StatusProtection = 0;
        SecureEngineSDK.CHECK_PROTECTION(ref StatusProtection, 0x33333333);

        if (StatusProtection == 0x33333333)
        {
            Console.WriteLine("Protection is correct");
        }
        else
        {
            Console.WriteLine("Application has been compromised");
        }

        SecureEngineSDK.VM_TIGER_WHITE_END();

        return result;
    }
    
    [UnmanagedCallersOnly(EntryPoint = "CheckPassword2")]
    public static bool CheckPassword2(IntPtr passwordPtr)
    {
        var result = Task.Run(async () => {
            SecureEngineSDK.VM_START();
            var password = Marshal.PtrToStringUni(passwordPtr);

            var correctPassword = (await File.ReadAllLinesAsync("password.txt")).First();

            var result = password == correctPassword;
            SecureEngineSDK.VM_END();
            return result;
        }).Result;
        
        return result;
    }
}