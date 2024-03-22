include!("SecureEngineSDK.rs");

fn main() {
    unsafe { VM_START(); }
    println!("Hello from VIRTUALIZER macro!"); 
    unsafe { VM_END(); }

    unsafe { VM_TIGER_WHITE_START(); }
    println!("Hello from TIGER_WHITE macro!");
    unsafe { VM_TIGER_WHITE_END(); }

    unsafe { VM_FISH_WHITE_START(); }
    println!("Hello from FISH_WHITE macro!");
    unsafe { VM_FISH_WHITE_END(); } 

    // Test check if running under VMWare or similar
    let my_var = &mut 5;
    let value:i32 = 0x11111111;
    unsafe { CHECK_VIRTUAL_PC(my_var, value); }

    if *my_var == 0x11111111
    {
        println!("Not running under VMware");
    }
    else 
    {
        println!("VMware found!!!");
    }
}

