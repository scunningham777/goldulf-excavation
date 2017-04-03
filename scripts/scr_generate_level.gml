///scr_generate_level
//Generate random level(rm_width_cells, rm_height_cells, openness_quotient)
var width = argument[0];
var height = argument[1];
var openness_quotient = argument[2];

room_width = CELL_WIDTH * (width + 2);
room_height = CELL_HEIGHT * (height + 2);

//Grid
grid = ds_grid_create(width, height)

//Fill the grid
ds_grid_set_region(grid, 0, 0, width - 1, height - 1, VOID )

//Random 
randomize();

//Controller

var cx = width / 2;
var cy = height / 2;

//Create Hero object
instance_create(cx * CELL_WIDTH + (CELL_WIDTH / 2), cy * CELL_HEIGHT + (CELL_HEIGHT / 2), obj_hero);

//Controller Direction
var cdir = irandom(3);

//Odds
var odds = 1;

//Create Level
repeat (openness_quotient)
{
    //Place floor 
    grid[# cx, cy] = FLOOR;
    
    //Randomize Directions
    if (irandom(odds) == odds )
    {
        cdir = irandom(3);
        
    }    
    
    //move
    var xdir = lengthdir_x(1, cdir * 90);
    var ydir = lengthdir_y(1, cdir * 90);
    cx += xdir;
    cy += ydir;
    
    //Don't move outside
    cx = clamp(cx, 1, width - 2)
    cy = clamp(cy, 1, height - 2) 
}

for (var yy = 1; yy < height - 1 ; yy++ ) {
    for (var xx = 1; xx < width - 1 ; xx++) {
        if (grid[# xx, yy] == FLOOR) {
            if(grid[# xx+1, yy] != FLOOR) grid[# xx+1, yy] = WALL;
            if(grid[# xx-1, yy] != FLOOR) grid[# xx-1, yy] = WALL;
            if(grid[# xx, yy+1] != FLOOR) grid[# xx, yy+1] = WALL;
            if(grid[# xx, yy-1] != FLOOR) grid[# xx, yy-1] = WALL;
         
        }    
    }
}
//Draw the level
for (var yy = 0; yy < height; yy++) {
    for (var xx = 0; xx < width; xx++) {
        if(grid[# xx, yy] == FLOOR) {
            tile_add(bg_floor, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx * CELL_WIDTH, yy * CELL_HEIGHT, 0)
        } else if (grid[# xx, yy] == WALL) {
              tile_add(bg_wall, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx * CELL_WIDTH, yy * CELL_HEIGHT, 0)  
        }
    }
}
