const std = @import("std");
const rl = @import("raylib");

var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const screenWidth = 800;
    const screenHeight = 800;
    const boardBorderWidth = 4.0;
    const boardGap = 4.0;
    const boardTileWidth = screenWidth / 3;
    const boardTileHeight = screenHeight / 3;

    rl.initWindow(screenWidth, screenHeight, "Sudoku");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        defer rl.endDrawing();

        rl.clearBackground(.white);

        rl.drawRectangleLinesEx(.{ .x = boardGap, .y = boardGap, .width = screenWidth - (boardGap * 2), .height = screenHeight - (boardGap * 2) }, boardBorderWidth, .black);

        // vertical lines
        for (1..3) |i| {
            rl.drawRectangle(@intCast(i * boardTileWidth), boardGap, boardBorderWidth, (screenHeight - (boardGap * 2)), .black);
        }

        // horizontal lines
        for (1..3) |i| {
            rl.drawRectangle(boardGap, @intCast(i * boardTileHeight), (screenWidth - (boardGap * 2)), boardBorderWidth, .black);
        }
    }
}
