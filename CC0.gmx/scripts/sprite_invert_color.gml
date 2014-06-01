/*
**  Usage:
**      sprite_invert_color(sprite)
**
**  Arguments:
**      sprite      sprite to change
**
**  Returns:
**      (-1) on error
**
**  Notes:
**      This script inverts the colors of a given sprite.
**      No new sprites are created, the given sprite is changed.
**
**  GMLscripts.com
*/
/*
{
    var sprite,w,h,n,p,s,l,xo,yo,surf,i,newsprite,alphasprite;
    sprite = argument0;
    w  = sprite_get_width(sprite);
    h  = sprite_get_height(sprite);
    n  = sprite_get_number(sprite);
    p  = sprite_get_precise(sprite);
    s  = sprite_get_smooth(sprite);
    l  = sprite_get_preload(sprite);
    xo = sprite_get_xoffset(sprite);
    yo = sprite_get_yoffset(sprite);
    surf = surface_create(w,h);
    if (surf < 0) return -1;
    surface_set_target(surf);
    for (i=0; i<n; i+=1) {
        draw_clear_alpha(c_white,1);
        draw_set_blend_mode_ext(bm_zero,bm_inv_src_color);
        draw_sprite(sprite,i,xo,yo);
        draw_set_blend_mode(bm_add);
        draw_rectangle_color(0,0,w,h,c_black,c_black,c_black,c_black,false);
        if (i == 0) {
            newsprite = sprite_create_from_surface(surf,0,0,w,h,p,0,s,l,xo,yo);
            if (newsprite < 0) {
                surface_free(surf);
                return -1;
            }
        }else{
            sprite_add_from_surface(newsprite,surf,0,0,w,h);
        }
        draw_clear_alpha(c_white,1);
        draw_set_blend_mode_ext(bm_zero,bm_src_alpha);
        draw_sprite(sprite,i,xo,yo);
        if (i == 0) {
            alphasprite = sprite_create_from_surface(surf,0,0,w,h,p,0,s,l,xo,yo);
            if (alphasprite < 0) {
                sprite_delete(newsprite);
                surface_free(surf)
                return -1;
            }
        }else{
            sprite_add_from_surface(alphasprite,surf,0,0,w,h);
        }
        draw_set_blend_mode(bm_normal);
    }
    surface_reset_target();
    sprite_assign(sprite,newsprite);
    sprite_set_alpha_from_sprite(sprite,alphasprite);
    sprite_delete(newsprite);
    sprite_delete(alphasprite);
    surface_free(surf);
}
*/
