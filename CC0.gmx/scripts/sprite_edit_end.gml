/*
**  Usage:
**      sprite_edit_end(session)
**
**  Arguments:
**      session     the editing session ID provided by sprite_edit_begin()
**
**  Returns:
**      nothing
**
**  Notes:
**      Ends the editing session started with sprite_edit_begin, replacing
**      the old sprite with the edited sprite and freeing the editing surface.
**
**  Dependencies:
**      sprite_edit_begin()
**
**  GMLscripts.com
*/
/*
{
    var session,p,surface,sprite,w,h,n,prec,tran,smth,load,xoff,yoff,temp,i;
    session = argument0        
    p = string_pos(':',session);
    surface = real(string_copy(session,1,p-1));
    sprite = real(string_copy(session,p+1,10));
    w = sprite_get_width(sprite);
    h = sprite_get_height(sprite);
    n = sprite_get_number(sprite);
    prec = sprite_get_precise(sprite);
    tran = sprite_get_transparent(sprite);
    smth = sprite_get_smooth(sprite);
    load = sprite_get_preload(sprite);
    xoff = sprite_get_xoffset(sprite);
    yoff = sprite_get_yoffset(sprite);
    temp = sprite_create_from_surface(surface,0,0,w,h,prec,tran,smth,load,xoff,yoff);
    for(i=1; i<n; i+=1) {
        sprite_add_from_surface(temp,surface,w*i,0,w,h);
    }
    sprite_assign(sprite,temp);
    sprite_delete(temp);
    surface_reset_target();
    surface_free(surface);
} */
