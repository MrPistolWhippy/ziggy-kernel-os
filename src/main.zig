const std = @import("std");

// This must be 'export' so the assembly in boot.s can find it
export fn kmain() noreturn {
    // Initialise your focal points here
    
    while (true) {
        // The Electric Teal Heartbeat
        asm volatile ("hlt");
    }
}

// Keep the linker end symbol visible
extern const _kernel_end: u8;
