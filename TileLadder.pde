class TileLadder extends Tile {

    TileLadder(int r, int c) {
        super(r, c);
        tileType = "Ladder";
        isGround = true;
        isWall = false;
    }

    void draw() {
        stroke(0);
        fill(0);
        rect(col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        image(ladder, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
    }
}

