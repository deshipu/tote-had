use <parts.scad>
use <tote.scad>

module body(explode) {
    board();
    components(0);
    translate([-19.15 - 2.56, -19.15, -0.8]) {
        rotate([0, 180, 0]) {
            translate([-5.5 * 2.54, 3.75 * 2.54, 1.8 + explode * 2])
                rotate(180) rc_servo_plug();
            translate([-6.5 * 2.54, 3.75 * 2.54, 1.8 + explode * 2])
                rotate(180) rc_servo_plug();
            translate([-7.5 * 2.54, 3.75 * 2.54, 1.8 + explode * 2])
                rotate(180) rc_servo_plug();
            translate([-8.5 * 2.54, 3.75 * 2.54, 1.8 + explode * 2])
                rotate(180) rc_servo_plug();
            translate([-9.5 * 2.54, 3.75 * 2.54, 1.8 + explode * 2])
                rotate(180) rc_servo_plug();
            translate([-10.5 * 2.54, 3.75 * 2.54, 1.8 + explode * 2])
                rotate(180) rc_servo_plug();
            translate([-6.5 * 2.54, 11.25 * 2.54, 1.8 + explode * 2])
                rc_servo_plug();
            translate([-7.5 * 2.54, 11.25 * 2.54, 1.8 + explode * 2])
                rc_servo_plug();
            translate([-8.5 * 2.54, 11.25 * 2.54, 1.8 + explode * 2])
                rc_servo_plug();
            translate([-9.5 * 2.54, 11.25 * 2.54, 1.8 + explode * 2])
                rc_servo_plug();
            translate([-10.5 * 2.54, 11.25 * 2.54, 1.8 + explode * 2])
                rc_servo_plug();
            translate([-11.5 * 2.54, 11.25 * 2.54, 1.8 + explode * 2])
                rc_servo_plug();
       }

    }
}

body(10);
