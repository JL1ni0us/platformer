class TileBrick extends Tile {

    TileBrick(int r, int c) {
        super(r, c);
        tileType = "Brick";
        isGround = true;
        isWall = true;
    }

    void draw() {
        image(brick, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
    }
}

