/*
**  Usage:
**      newsprite = sprite_replace_color_blend(sprite,oldcolor,
**                     newcolor,trancolor,htol,stol,vtol,blend)
**
**  Given:    
**      sprite      sprite index
**      oldcolor    original color
**      newcolor    replacement color
**      trancolor   transparency color of the new sprite
**      htol        hue tolerance, real
**      stol        saturation tolerance, real
**      vtol        value tolerance, real
**      blend       blend shading, true/false
**
**  Returns:
**      sprite index, or (-1) on error
**
**  Notes:
**      (trancolor) must be supplied, it is the color used for the
**      new sprite's transparency mask.
**
**      Three tolerance arguments (htol,stol,vtol) contol exactly
**      which colors are replaced. A higher tolerance will match
**      a broader range of hue, saturation, or value. Values
**      around (htol = 20; stol = 240; vtol = 240) work well.
**
**      If (blend) is set to true (recommeded), changed colors
**      will retain their original shading.
**
**      This function creates new sprites. It should only be
**      called once per color replacement, such as the Create Event
**      of an instance. You should be careful to delete created
**      sprites when you are done with them. This function draws
**      to the frame buffer and should never be called during the
**      Draw Event. Sprite colors in 16-bit color mode are not
**      exact. They can shift from expected values in-game. Use
**      the tolerance controls to compensate. Finally, this
**      function is not fast. It is very slow with large sprites
**      and/or sprites with many frames. 
**
**  GMLscripts.com
*/
/*{
    var sprite,oldcolor,newcolor,trancolor,htol,stol,vtol,blend;
    sprite = argument0;
    oldcolor = argument1;
    newcolor = argument2;
    trancolor = argument3;
    htol = argument4;
    stol = argument5;
    vtol = argument6;
    blend = argument7;
    var p,t,s,l,xo,yo,n,w,h,oh,os,ov,nh,ns,nv;
    var i,sx,sy,color,th,ts,tv,dh,ds,dv,hue,sat,val,newsprite;
    p  = sprite_get_precise(sprite);
    t  = sprite_get_transparent(sprite);
    s  = sprite_get_smooth(sprite);
    l  = sprite_get_preload(sprite);
    xo = sprite_get_xoffset(sprite);
    yo = sprite_get_yoffset(sprite);
    n  = sprite_get_number(sprite);
    w  = sprite_get_width(sprite);
    h  = sprite_get_height(sprite);
    oh = color_get_hue(oldcolor);
    os = color_get_saturation(oldcolor);
    ov = color_get_value(oldcolor);
    nh = color_get_hue(newcolor);
    ns = color_get_saturation(newcolor);
    nv = color_get_value(newcolor);
    for(i=0;i<n;i+=1) {
        draw_set_color(trancolor);
        draw_rectangle(0,0,w,h,false);
        draw_sprite(sprite,i,xo,yo);
        for(sx=0;sx<w;sx+=1) {
            for(sy=0;sy<h;sy+=1) {
                color = draw_getpixel(sx,sy);
                th = color_get_hue(color);
                ts = color_get_saturation(color);
                tv = color_get_value(color);
                dh = th-oh;
                ds = ts-os;
                dv = tv-ov;
                if (abs(dh)>128) dh = sign(dh)*256-dh;
                if (abs(dh)<htol && abs(ds)<stol && abs(dv)<vtol) {
                    if (blend) {
                        hue = (nh+dh+256) mod 256;
                        sat = min(max(0,ns+ds),255);
                        val = min(max(0,nv+dv),255);
                        draw_point_color(sx,sy,make_color_hsv(hue,sat,val));
                    }
                }
            }
        }
        if (i==0) {
            newsprite = sprite_create_from_screen(0,0,w,h,p,t,s,l,xo,yo);
            if (newsprite<0) return -1;
        }else{
            sprite_add_from_screen(newsprite,0,0,w,h);
        }
    }
    return newsprite;
}*/
