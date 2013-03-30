class TileBridgeRails extends Tile {

    TileBridgeRails(int r, int c) {
        super(r, c);
        tileType = "BridgeRails";
        isGround = false;
        isWall = false;
    }


    void draw() {
        if (wTile().equals("BridgeRails") && eTile().equals("BridgeRails")) {
            drawSky();
            image(bridgeRails_center, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (eTile().equals("BridgeRails")) {
            drawSky();
            image(bridgeRails_w, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else {
            drawSky();
            image(bridgeRails_e, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
    }
}

