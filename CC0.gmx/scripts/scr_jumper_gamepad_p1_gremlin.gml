// These _n# scripts are basically boilerplate code.
// Without _n input -> Less errors, perhaps faster.
// you better have grep and grip installed...
if (gamepad_button_check_pressed(__p1, gp_face1)) {
    if (grip < magic_grip_threshold && grep > magic_grep_threshold) {
        // mad ups
        grep = grep / 2;
        physics_apply_impulse(phy_com_x,phy_com_y,
            0,magic_jump_impulse_gremlin - grep + grip );
    }
    grip = grip + 10;
}

if (gamepad_button_check(__p1,gp_face1)) {
  // slight ups for holding jump
  physics_apply_force(phy_com_x,phy_com_y,0,magic_jump_force_gremlin);
}
else if (gamepad_button_check_released(__p1,gp_face1)) {
    // tiny fall for letting go
    physics_apply_impulse(phy_com_x,phy_com_y,0,magic_let_go_gremlin);
}
