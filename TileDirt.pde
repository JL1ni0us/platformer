class TileDirt extends Tile {

    TileDirt(int r, int c) {
        super(r, c);
        tileType = "Dirt";
        isGround = true;
        isWall = true;
    }

    void draw() {
        if (n() && s() && e() && w() && ne() && nw() && se() && sw()) {
            image(dirt_center, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (!n() && s() && e() && w() && se() && sw()) {
            image(dirt_n, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (n() && !s() && e() && w() && ne() && nw()) {
            image(dirt_s, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (!n() && s() && e() && !w() && !nw() && se()) {
            image(dirt_nw, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (!n() && s() && !e() && w() && !ne() && sw()) {
            image(dirt_ne, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (n() && !s() && !e() && w() && !ne() && nw() && !se() && !sw()) {
            image(dirt_se, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (n() && s() && e() && !w() && ne() && se()) {
            image(dirt_w, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (n() && s() && !e() && w() && nw() && sw()) {
            image(dirt_e, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }                    
        else if (n() && !s() && !e() && w() && nw()) {
            image(dirt_se, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else if (n() && !s() && e() && !w() && ne() && !sw()) {
            image(dirt_sw, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
        else {
            image(dirt_center, col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
        }
    }

    boolean n() {
        return nTile().equals("Dirt");
    }

    boolean ne() {
        return neTile().equals("Dirt");
    }

    boolean nw() {
        return nwTile().equals("Dirt");
    }

    boolean s() {
        return sTile().equals("Dirt");
    }

    boolean se() {
        return seTile().equals("Dirt");
    }

    boolean sw() {
        return swTile().equals("Dirt");
    }

    boolean e() {
        return eTile().equals("Dirt");
    }

    boolean w() {
        return wTile().equals("Dirt");
    }
}   

