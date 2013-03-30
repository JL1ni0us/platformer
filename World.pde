class World {

    Tile[][] map;

    World() {
        map     = new Tile[mapImg.height][mapImg.width];
    }

    void loadMap(PImage mapImg) {
        for (int row = 0; row < mapImg.height; row++) {
            for (int col = 0; col < mapImg.width; col++) {
                if (mapImg.get(col, row) == BRICK)
                    map[row][col] = new TileBrick(row, col);
                else if (mapImg.get(col, row) == BRIDGE)
                    map[row][col] = new TileBridge(row, col);
                else if (mapImg.get(col, row) == BRIDGE_RAILS)
                    map[row][col] = new TileBridgeRails(row, col);
                else if (mapImg.get(col, row) == CAVE_BKG)
                    map[row][col] = new TileCaveBkg(row, col);
                else if (mapImg.get(col, row) == DIRT)
                    map[row][col] = new TileDirt(row, col);
                else if (mapImg.get(col, row) == LADDER)
                    map[row][col] = new TileLadder(row, col);
                else if (mapImg.get(col, row) == LAVA)
                    map[row][col] = new TileLava(row, col);
                else if (mapImg.get(col, row) == SKY_BKG)
                    map[row][col] = new TileSkyBkg(row, col);
                else if (mapImg.get(col, row) == TREE_TOP)
                    map[row][col] = new TileTreeTop(row, col);
                else if (mapImg.get(col, row) == TREE_TRUNK)
                    map[row][col] = new TileTreeTrunk(row, col);
                else if (mapImg.get(col, row) == WATER)
                    map[row][col] = new TileWater(row, col);
                else
                    map[row][col] = new TileCaveBkg(row, col);
            }
        }
    }

    Tile tileAt(PVector loc) {
        int row = (int)(loc.y/GRID_SIZE);
        int col = (int)(loc.x/GRID_SIZE);
        return map[row][col];
    }

    float topOfSquare(PVector thisPosition) {
        int thisY = int(thisPosition.y);
        thisY /= GRID_SIZE;
        return float(thisY*GRID_SIZE);
    }

    float bottomOfSquare(PVector thisPosition) {
        if (thisPosition.y<0) {
            return 0;
        }
        return topOfSquare(thisPosition)+GRID_SIZE;
    }

    float leftOfSquare(PVector thisPosition) {
        int thisX = int(thisPosition.x);
        thisX /= GRID_SIZE;
        return float(thisX*GRID_SIZE);
    }

    float rightOfSquare(PVector thisPosition) {
        if (thisPosition.x<0) {
            return 0;
        }
        return leftOfSquare(thisPosition)+GRID_SIZE;
    }

    void checkKeys() {
        if (myKbd.holdingW) {
            GRID_SIZE++;
        }
        if (myKbd.holdingS) {
            GRID_SIZE--;
        }
    }

    void draw() {
        rectMode(CORNER);
        for (int row = 0; row < mapImg.height; row++) {
            for (int col = 0; col < mapImg.width; col++) {
               map[row][col].draw();
            }
        }
    }
}

