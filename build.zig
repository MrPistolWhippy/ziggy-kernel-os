const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .x86_64,
        .os_tag = .freestanding,
        .abi = .none,
    });

    const kernel = b.addExecutable(.{
        .name = "ziggy_os.elf",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = b.standardOptimizeOption(.{}),
        .code_model = .kernel,
    });

    kernel.setLinkerScript(b.path("src/linker.ld"));
    kernel.addAssemblyFile(b.path("src/boot.s"));
    b.installArtifact(kernel);
}
