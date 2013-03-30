class Player {

    PVector location, velocity;
    Boolean onGround;
    int wallProbeDistance;
    int ceilingProbeDistance;

    // used as probes to detect running into walls, ceiling
    PVector leftSideHigh, rightSideHigh, leftSideLow, rightSideLow, topSide;

    final int SPEED = 5;   
    final float FRICTION = 0.6;
    final float GRAVITY_POWER = 1; 

    Player() {
        location = new PVector(39 * GRID_SIZE, 10 * GRID_SIZE);
        velocity = new PVector(0, 0);
        onGround = true;

        wallProbeDistance = int(GRID_SIZE * 0.4);
        ceilingProbeDistance = int(GRID_SIZE * 0.95);

        leftSideHigh = new PVector();
        rightSideHigh = new PVector();
        leftSideLow = new PVector();
        rightSideLow = new PVector();
        topSide = new PVector();
    }

    void checkKeys() {
        if (myKbd.holdingLeft) {
            velocity.x -= SPEED;
        }
        else if (myKbd.holdingRight) {
            velocity.x += SPEED;
        }
        if (myKbd.holdingUp && onGround) {
            velocity.y = -20;
        }
        velocity.x *= FRICTION;
    }

    void move() {
        location.add(velocity);
    }

    void checkWalls() {
        // update wall probes
        leftSideHigh.x  = leftSideLow.x   = location.x - wallProbeDistance; // left edge of player
        rightSideHigh.x = rightSideLow.x  = location.x + wallProbeDistance; // right edge of player
        topSide.x                         = location.x;                     // center of player

        leftSideLow.y   = rightSideLow.y  = location.y - 0.2 * GRID_SIZE;  // shin high
        leftSideHigh.y  = rightSideHigh.y = location.y - 0.8 * GRID_SIZE;  // shoulder high
        topSide.y                         = location.y - ceilingProbeDistance; //top of player

        if (myWorld.tileAt(topSide).isGround()) {
            if (onGround) { 
                location.sub(velocity);
                //velocity.x=0.0;
                velocity.y=0.0;
            } 
            else {
                location.y = myWorld.bottomOfSquare(topSide) + ceilingProbeDistance;
                if (velocity.y < 0) {
                    velocity.y = 0.0;
                }
            }
        }


        if (myWorld.tileAt(leftSideLow).isWall()) {
            location.x = myWorld.rightOfSquare(leftSideLow) + wallProbeDistance;
            if (velocity.x < 0) {
                velocity.x = 0.0;
            }
        }

        if (myWorld.tileAt(leftSideHigh).isWall()) {
            location.x = myWorld.rightOfSquare(leftSideHigh) + wallProbeDistance;
            if (velocity.x < 0) {
                velocity.x = 0.0;
            }
        }

        if (myWorld.tileAt(rightSideLow).isWall()) {
            location.x = myWorld.leftOfSquare(rightSideLow) - wallProbeDistance;
            if (velocity.x > 0) {
                velocity.x = 0.0;
            }
        }

        if (myWorld.tileAt(rightSideHigh).isWall()) {
            location.x = myWorld.leftOfSquare(rightSideHigh) - wallProbeDistance;
            if (velocity.x > 0) {
                velocity.x = 0.0;
            }
        }
    }



    void checkGravity() {
        if (!myWorld.tileAt(location).isGround()) {
            onGround = false;
        }

        if (!onGround) {
            if (myWorld.tileAt(location).isGround()) {
                onGround = true;
                location.y = myWorld.topOfSquare(location);
                velocity.y = 0;
            }
            else { 
                velocity.y += GRAVITY_POWER;
            }
        }
    }

    void draw() {
        imageMode(CORNER);
        strokeWeight(2);
        strokeCap(ROUND);
        stroke(255);        
        fill(60, 225, 40);
        roundedRect(location.x - GRID_SIZE/2, location.y - GRID_SIZE, GRID_SIZE, GRID_SIZE, 10, 10);
        fill(255, 0, 0);
        ellipse((int)leftSideHigh.x,  (int)leftSideHigh.y,  5, 5);
        ellipse((int)leftSideLow.x,   (int)leftSideLow.y,   5, 5);
        ellipse((int)rightSideHigh.x, (int)rightSideHigh.y, 5, 5);
        ellipse((int)rightSideLow.x,  (int)rightSideLow.y,  5, 5);
        ellipse((int)topSide.x,       (int)topSide.y,       5, 5);
        ellipse((int)location.x,      (int)location.y,      5, 5);
    }

    void roundedRect(float x, float y, float w, float h, float rx, float ry)
    {
        beginShape();
        vertex(x, y+ry); //top of left side 
        bezierVertex(x, y, x, y, x+rx, y); //top left corner

        vertex(x+w-rx, y); //right of top side 
        bezierVertex(x+w, y, x+w, y, x+w, y+ry); //top right corner

        vertex(x+w, y+h-ry); //bottom of right side
        bezierVertex(x+w, y+h, x+w, y+h, x+w-rx, y+h); //bottom right corner

        vertex(x+rx, y+h); //left of bottom side
        bezierVertex(x, y+h, x, y+h, x, y+h-ry); //bottom left corner

        endShape(CLOSE);
    }
}

