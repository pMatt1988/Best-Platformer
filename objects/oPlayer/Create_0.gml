hsp = 0;
vsp = 0;

spd = 4.3;

tilemap = layer_tilemap_get_id("Walls");

tilesize = 32;


right_offset = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
left_offset = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
bottom_offset = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
top_offset = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

grounded = false;