class TileTreeTop extends Tile {

    TileTreeTop(int r, int c) {
        super(r, c);
        tileType = "TreeTop";
        isGround = true;
        isWall = false;
    }

    void draw() {
        if (sTile().equals("TreeTrunk")) {
            drawSky();
            image(treeIntersect, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (!wTile().equals("TreeTop")) {
            drawSky();
            image(treetop_w, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (!eTile().equals("TreeTop")) {
            drawSky();
            image(treetop_e, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else {
            drawSky();
            image(treetop_center, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
    } 
}
