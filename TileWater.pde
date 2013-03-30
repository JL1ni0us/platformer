class TileWater extends Tile {
    
    int costume;

    TileWater(int r, int c) {
        super(r, c);
        tileType = "Water";
        isGround = false;
        isWall = false;
        costume = (int)random(0,3);
    }
    
    void draw() {
        if (!nTile().equals("Water")) {
            image(water[costume], col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
            if (frameCount % 3 == 0) { 
                costume++;
                if (costume == water.length - 1)
                    costume = 0;
            }
        } else {
            stroke(5, 109, 177);
            fill(5, 109, 177);
            rect(col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);            
        }
        
    }
}

