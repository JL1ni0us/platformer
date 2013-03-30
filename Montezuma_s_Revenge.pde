color BRICK        = color(255, 201, 14);
color BRIDGE       = color(136, 0, 21);
color BRIDGE_RAILS = color(255, 174, 201);
color CAVE_BKG     = color(0, 0, 0);
color DIRT         = color(185, 122, 87);
color LADDER       = color(63, 72, 204);
color LAVA         = color(237, 28, 36 );
color SKY_BKG      = color(0, 162, 232);
color TREE_TOP     = color(181, 230, 29);
color TREE_TRUNK   = color(195, 195, 195);
color WATER        = color(153, 217, 234);

int GRID_SIZE = 40;

PImage  brick, ladder, dirt_n, dirt_s, dirt_e, dirt_w, dirt_ne, dirt_nw, 
dirt_se, dirt_sw, dirt_center, bridgeRails_center, bridgeRails_w, bridgeRails_e, 
bridge_center, bridge_w, bridge_e, treeTrunk, treeIntersect, treetop_center, 
treetop_e, treetop_w, mapImg;

PImage[] lava, water;

Keyboard myKbd;
World    myWorld;
Player   myPlayer;

// we use this to track how far the camera has scrolled left or right
float cameraOffsetX, cameraOffsetY;


void setup() {
    size(800, 800);
    frameRate(24);

    cameraOffsetX = 0.0;
    cameraOffsetY = 0.0;

    mapImg  = loadImage("level1.png");
    myWorld = new World();
    myWorld.loadMap(mapImg);
    lava  = new PImage[5];
    water = new PImage[4];
    
    myKbd     = new Keyboard();
    myPlayer  = new Player();

    brick              = loadImage("images/brick.png");
    bridge_center      = loadImage("images/bridge_center.png");
    bridge_w           = loadImage("images/bridge_w.png");
    bridge_e           = loadImage("images/bridge_e.png");
    bridgeRails_center = loadImage("images/bridgeRails_center.png");
    bridgeRails_w      = loadImage("images/bridgeRails_w.png");
    bridgeRails_e      = loadImage("images/bridgeRails_e.png");
    ladder             = loadImage("images/ladder.png");
    lava[0]            = loadImage("images/lava1.png");
    lava[1]            = loadImage("images/lava2.png");
    lava[2]            = loadImage("images/lava3.png");
    lava[3]            = loadImage("images/lava4.png");
    lava[4]            = loadImage("images/lava5.png");
    dirt_n             = loadImage("images/dirt_n.png");
    dirt_s             = loadImage("images/dirt_s.png");
    dirt_e             = loadImage("images/dirt_e.png");
    dirt_w             = loadImage("images/dirt_w.png");
    dirt_ne            = loadImage("images/dirt_ne.png");
    dirt_nw            = loadImage("images/dirt_nw.png");
    dirt_se            = loadImage("images/dirt_se.png");
    dirt_sw            = loadImage("images/dirt_sw.png");
    dirt_center        = loadImage("images/dirt_center.png");
    treeTrunk          = loadImage("images/tree_trunk.png");
    treeIntersect      = loadImage("images/tree_intersect.png");
    treetop_center     = loadImage("images/treetop_center.png");
    treetop_e          = loadImage("images/treetop_e.png");
    treetop_w          = loadImage("images/treetop_w.png");
    water[0]           = loadImage("images/water1.png");
    water[1]           = loadImage("images/water2.png");
    water[2]           = loadImage("images/water3.png");
    water[3]           = loadImage("images/water4.png");
}

void updateCameraPosition() {
    int rightEdge  = mapImg.width  * GRID_SIZE - width;
    int bottomEdge = mapImg.height * GRID_SIZE - height;
    // the left side of the camera view should never go right of the above number
    // think of it as "total width of the game world" (World.GRID_UNITS_WIDE*World.GRID_UNIT_SIZE)
    // minus "width of the screen/window" (width)

    cameraOffsetX = myPlayer.location.x - width/2;
    if (cameraOffsetX < 0) {
        cameraOffsetX = 0;
    }
    if (cameraOffsetX > rightEdge) {
        cameraOffsetX = rightEdge;
    }

    cameraOffsetY = myPlayer.location.y - height/2;
    /*
    if (cameraOffsetY < 0) {
     cameraOffsetY = 0;
     }
     if (cameraOffsetY < bottomEdge) {
     cameraOffsetY = bottomEdge;
     }*/
}

void keyPressed(KeyEvent evt) {
    myKbd.pressKey(evt.getKeyCode());
}

void keyReleased(KeyEvent evt) {
    myKbd.releaseKey(evt.getKeyCode());
}

void draw() {
    background(SKY_BKG);
    pushMatrix(); // lets us easily undo the upcoming translate call
    translate(-cameraOffsetX, -cameraOffsetY); // affects all upcoming graphics calls, until popMatrix

    updateCameraPosition();

    myWorld.checkKeys();
    myWorld.draw();
    if (!(myKbd.holdingS || myKbd.holdingW)) {
        myPlayer.checkKeys();
        myPlayer.move();
        myPlayer.checkWalls();
        myPlayer.checkGravity();
        myPlayer.draw();
    }
    else {
        myPlayer.stickToTile();   
    }

    popMatrix();
}

