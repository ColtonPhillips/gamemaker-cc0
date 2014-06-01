/*
**  Usage:
**      session = sprite_edit_begin(sprite)
**
**  Arguments:
**      sprite      sprite to edit
**
**  Returns:
**      session     an editing session ID
**
**  Notes:
**      Begins a sprite editing session. All draw commands are directed to a
**      surface holding the a horizontal strip of each of the frames in the
**      given sprite. When finished editing, call function sprite_edit_end()
**      to implement the sprite changes and to reset the drawing surface.
**      Resets blending mode to normal.
**
**  Dependencies:
**      sprite_edit_end()
**
**  GMLscripts.com
*/
{
    var sprite,a,w,h,n,xoff,yoff,surface,i;
    sprite = argument0;
    a = draw_get_alpha();
    w = sprite_get_width(sprite);
    h = sprite_get_height(sprite);
    n = sprite_get_number(sprite);
    xoff = sprite_get_xoffset(sprite);
    yoff = sprite_get_yoffset(sprite);
    surface = surface_create(w*n,h);
    surface_set_target(surface);
    draw_clear(c_black);
    draw_set_blend_mode_ext(bm_one,bm_zero);
    draw_set_alpha(1);
    for(i=0; i<n; i+=1) {
        draw_sprite(sprite,i,i*w+xoff,yoff);
    }
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(a);
    return (string(surface)+':'+string(sprite));
}
