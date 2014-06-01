/*
**  Usage:
**      dsid = motion_predict(instance,steps);
**
**  Arguments:
**      instance    an instance id
**      steps       number of steps to look ahead
**
**  Returns:
**      dsid        ds_list loaded with the predicted positions
**                  of the given instance with regard to its
**                  current motion, friction, and gravity.
**                      
**  Notes:
**      ds_list = { x0,y0,x1,y1,x2,y2,x3,y3,...,xn,yn }
**
**  GMLscripts.com
*/
{
    var instance,steps,dsid,posx,posy,hspd,vspd,grvx,grvy,spd,dir;
    instance = argument0;
    steps = argument1;
    dsid = ds_list_create();
    with (instance) {
        posx = x;
        posy = y;
        hspd = hspeed;
        vspd = vspeed;
        grvx = lengthdir_x(gravity,gravity_direction);
        grvy = lengthdir_y(gravity,gravity_direction);
        repeat (steps) {
			spd = point_distance(0,0,hspd,vspd);
			spd = max(0, spd-friction)/spd;
			hspd *= spd;
			vspd *= spd;
            hspd += grvx;
            vspd += grvy;
            posx += hspd;
            posy += vspd;
            ds_list_add(dsid,posx);
            ds_list_add(dsid,posy);
        }
    }
    return dsid;
}