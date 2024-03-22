using System.Runtime.InteropServices;

namespace ExampleAotApp;

public static class NativeImports
{
    [DllImport("NativeAotLib")]
    public static extern bool CheckPassword(IntPtr passwordPtr);
    
    [DllImport("NativeAotLib")]
    public static extern bool CheckPassword2(IntPtr passwordPtr);
}