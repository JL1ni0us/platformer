class TileTreeTrunk extends Tile {

    TileTreeTrunk(int r, int c) {
        super(r, c);
        tileType = "TreeTrunk";
        isGround = false;
        isWall = false;
    }

    void draw() {
        drawSky();
        image(treeTrunk, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
    }
}

