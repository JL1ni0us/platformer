abstract class Tile {

    int row, col, lastRow, lastCol;
    String tileType;
    boolean isGround, isWall;

    Tile(int r, int c) {
        row = r;
        col = c;
        lastRow = mapImg.height - 1;
        lastCol = mapImg.width - 1;
    }

    boolean equals (String t) {
         return t.equals(tileType);   
    }

    boolean isGround() {
        return isGround;
    }

    boolean isWall() {
        return isWall;
    }

    Tile nTile() {
        if (row != 0)
            return myWorld.map[row - 1][col];
        else
            return null;
    }

    Tile sTile() {
        if (row != lastRow)
            return myWorld.map[row + 1][col];
        else
            return null;
    }

    Tile eTile() {
        if (col != lastCol) 
            return myWorld.map[row][col + 1];
        else
            return null;
    }

    Tile wTile() {
        if (col != 0)
            return myWorld.map[row][col - 1];
        else
            return null;
    }

    Tile neTile() {
        if (row != 0 && col != lastCol) 
            return myWorld.map[row - 1][col + 1];
        else
            return null;
    }

    Tile nwTile() {
        if (row != 0 && col != 0)
            return myWorld.map[row - 1][col - 1];
        else
            return null;
    }

    Tile seTile() {
        if (row != lastRow && col != lastCol)
            return myWorld.map[row + 1][col + 1];
        else
            return null;
    }

    Tile swTile() {
        if (row != lastRow && col != 0)
            return myWorld.map[row + 1][col - 1];
        else
            return null;
    }
    
    void drawSky() {
        noStroke();
        fill(SKY_BKG);
        rect(col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
    }

    void draw() {
        return;
    }
}

