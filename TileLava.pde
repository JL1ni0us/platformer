class TileLava extends Tile {
    
    int costume;

    TileLava(int r, int c) {
        super(r, c);
        tileType = "Lava";
        isGround = false;
        isWall = false;
        costume = 0;
    }

    void draw() {
        stroke(0);
        fill(0);
        rect(col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
         if (!nTile().equals("Lava")) {
            image(lava[costume], col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);
            if (frameCount % 3 == 0) { 
                costume++;
                if (costume == lava.length - 1)
                    costume = 0;
            }
        } else {
            stroke(117, 0, 0);
            fill(117, 0, 0);
            rect(col * GRID_SIZE, row * GRID_SIZE, GRID_SIZE, GRID_SIZE);            
        }
        
    }
}

