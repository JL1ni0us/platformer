class TileCaveBkg extends Tile {

    TileCaveBkg(int r, int c) {
        super(r, c);
        tileType = "CaveBkg";
        isGround = false;
        isWall = false;
    }

    void draw() {
        stroke(CAVE_BKG);
        fill(CAVE_BKG);
        rect(col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
    }
}

