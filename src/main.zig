const std = @import("std");
const rl = @import("raylib");

var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const screenHeight = 800;
    const screenWidth = 800;
    const boardBorderWidth = 4.0;

    rl.initWindow(screenWidth, screenHeight, "Sudoku");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    const boardShape: rl.Rectangle = .{ .height = screenHeight - boardBorderWidth, .width = screenWidth - boardBorderWidth, .x = boardBorderWidth / 2, .y = boardBorderWidth / 2 };

    while (!rl.windowShouldClose()) {
        defer rl.endDrawing();

        rl.clearBackground(.white);

        rl.drawRectangleLinesEx(boardShape, 4.0, .black);
    }
}
