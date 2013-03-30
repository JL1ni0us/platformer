class TileBridge extends Tile {

    TileBridge(int r, int c) {
        super(r, c);
        tileType = "Bridge";
        isGround = true;
        isWall = false;
    }

    void draw() {
        if (wTile().equals("Bridge") && eTile().equals("Bridge")) {
            drawSky();
            image(bridge_center, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (eTile().equals("Bridge")) {
            drawSky();
            image(bridge_w, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else {
            drawSky();
            image(bridge_e, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
    }
}

