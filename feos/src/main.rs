// Don't link the std, remove the "main" entry point
#![no_std]
#![no_main]

mod vga_buffer;

// Without std, we must provide our own panic handler
use core::panic::PanicInfo;

#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    println!("{}", info);
    loop {}
}

#[no_mangle]
pub extern "C" fn _start() -> ! {
    println!("Hello, World{}", "!");
    panic!("Some panic message");
    loop {}
}
