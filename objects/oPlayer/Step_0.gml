/// @description Insert description here
// You can write your code in this editor

key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

moveX = key_right - key_left;
moveY = key_down - key_up;


hsp = moveX * spd;
vsp = Approach(vsp, 7.5, 0.4);
//vsp = min(7.5, vsp + 0.4);

var bbox_side;
#region ground
//Check ground
grounded = false;
if (tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom + 1)) || (tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom + 1)) {
	grounded = true;
}

if(grounded && keyboard_check_pressed(vk_space)) {
	vsp = -10;
}
#endregion


#region COLLISION
if(hsp != 0) {
	bbox_side = hsp > 0 ? bbox_right : bbox_left;
	
	if(tilemap_get_at_pixel(tilemap, bbox_side + round(hsp), bbox_top) != 0) ||
	 (tilemap_get_at_pixel(tilemap, bbox_side + round(hsp), bbox_bottom) != 0) {
		if(hsp > 0) x = x - (x mod tilesize) + 31 - right_offset;
		else x = x - (x mod 32) - left_offset;
		hsp = 0; 
	}
}

if(vsp != 0) {
	bbox_side = vsp > 0 ? bbox_bottom : bbox_top;
	if(tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + round(vsp)) != 0) ||
	 (tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + round(vsp)) != 0) {
		if(vsp > 0) y = y - (y mod tilesize) + 31 - bottom_offset;
		else y = y - (y mod 32) - left_offset;
		vsp = 0; 
	}
}

#endregion


x += hsp;
y += vsp;