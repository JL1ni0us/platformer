class TileSkyBkg extends Tile {

    TileSkyBkg(int r, int c) {
        super(r, c);
        tileType = "SkyBkg";
        isGround = false;
        isWall = false;
    }

    void draw() {
        drawSky();
    }
}

