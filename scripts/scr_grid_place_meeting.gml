///scr_grid_place_meeting(x, y)
var xx = argument[0];
var yy = argument[1];

//store original position
var prev_x = x;
var prev_y = y;

//update current position for bbox calculations
x = xx;
y = yy;

//check for x meeting
var x_meeting = (obj_grid_level.grid[# bbox_right / CELL_WIDTH, bbox_top / CELL_HEIGHT] != FLOOR ) ||
                (obj_grid_level.grid[# bbox_left / CELL_WIDTH, bbox_top / CELL_HEIGHT] != FLOOR );

//check for y meeting
var y_meeting = (obj_grid_level.grid[# bbox_right / CELL_WIDTH, bbox_bottom / CELL_HEIGHT] != FLOOR) ||
                (obj_grid_level.grid[# bbox_left / CELL_WIDTH, bbox_bottom / CELL_HEIGHT] != FLOOR);
                
//check for center meeting
var center_meeting = obj_grid_level.grid[# xx / CELL_WIDTH, yy / CELL_HEIGHT] != FLOOR;

//move back
x = prev_x;
y = prev_y;

//Return meeting result
return x_meeting || y_meeting || center_meeting;
                
