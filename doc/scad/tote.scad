use <parts.scad>


module coxa(explode, colors=false) {
    if (colors) {
        SG90("Blue");
        translate([18, -22 - explode, -28.75])
            rotate([90, 180, 90]) SG90("Red");
    } else {
        SG90();
        translate([18, -22 - explode, -28.75])
            rotate([90, 180, 90]) SG90();
    }
}

module femur(explode) {
    SG90_single_horn();
    translate([17.6, 0, 0]) {
        translate([0, 0, 6 - explode]) rotate([0, 180, 0])
            SG90_double_horn();
        translate([-6, 0, 5 - explode * 1.5]) rotate([0, 180, 0])
            SG90_mount_screw();
        translate([-12, 0, 5 - explode * 1.5]) rotate([0, 180, 0])
            SG90_mount_screw();
        translate([6, 0, 5 - explode * 1.5]) rotate([0, 180, 0])
            SG90_mount_screw();
        translate([12, 0, 5 - explode * 1.5]) rotate([0, 180, 0])
            SG90_mount_screw();
    }
    translate([35.2, 0, 0]) rotate([0, 0, 180]) SG90_single_horn();
}

module tibia(explode, colors=false) {
    if (colors) {
        SG90("Green");
    } else {
        SG90();
    }
    translate([0, -20.3, -15 - explode]) rotate([0, 0, 90]) SG90_cross_horn();
    translate([0, -19.8, -12.6 + explode]) SG90_mount_screw();
}

module leg(hip, knee, ankle, explode) {
    SG90_single_horn();
    translate([0, 0, explode]) SG90_horn_screw();
    translate([0, 0, -explode * 2]) rotate(hip - 40) {
        coxa(explode);
        translate([18, -22 - explode, -28.75]) rotate([90, 180, 90]) {
            translate([0, 0, explode * 2]) rotate(knee) {
                translate([0, 0, explode]) SG90_horn_screw();
                femur(explode);
                translate([35.2, 0, 0]) rotate([0, 0, 180]) {
                    translate([0, 0, explode]) SG90_horn_screw();
                    translate([0, 0, -explode * 2]) rotate(ankle) tibia(explode);
                }
            }
        }
    }
}

module board() {
    color("Black") difference() {
        hull() {
            translate([20.75, 20.75, 0]) cylinder(r=4, h=0.6, $fn=20);
            translate([-20.75, -20.75, 0]) cylinder(r=4, h=0.6, $fn=20);
            translate([20.75, -20.75, 0]) cylinder(r=4, h=0.6, $fn=20);
            translate([-20.75, 20.75, 0]) cylinder(r=4, h=0.6, $fn=20);
        }
        translate([20.75, 20.75, -2]) {
            cylinder(r=3.2, h=4, $fn=12);
            translate([-6, 0.1, 0]) cylinder(r=0.6, h=4, $fn=8);
            translate([-12, 0.2, 0]) cylinder(r=0.6, h=4, $fn=8);
        }
        translate([-20.75, -20.75, -2]) {
            cylinder(r=3.2, h=4, $fn=12);
            translate([6, -0.1, 0]) cylinder(r=0.6, h=4, $fn=8);
            translate([12, -0.2, 0]) cylinder(r=0.6, h=4, $fn=8);
        }
        translate([20.75, -20.75, -2]) {
            cylinder(r=3.2, h=4, $fn=12);
            translate([-6, -0.1, 0]) cylinder(r=0.6, h=4, $fn=8);
            translate([-12, -0.2, 0]) cylinder(r=0.6, h=4, $fn=8);
        }
        translate([-20.75, 20.75, -2]){
            cylinder(r=3.2, h=4, $fn=12);
            translate([6, 0.1, 0]) cylinder(r=0.6, h=4, $fn=8);
            translate([12, 0.2, 0]) cylinder(r=0.6, h=4, $fn=8);
        }
    }
    translate([20.75, 20.75, -2]) {
    }
}

module components(explode) {
    translate([-19.15, -19.15, -0.8]) {
        translate([1.27 * 22, 2.54 * 11, -explode]) rotate([0, 180, 90])
            arduino_pro_mini();
        translate([5, 6, 0 - explode]) rotate([0, 180, 0]) capacitor();
        translate([2.54 * -1, 2.54 * 9, 7 + explode]) rotate([180, 0, -90]) switch();
        for (x = [0:5]) for (y = [0:2]) {
            translate([1.27 * 10 + 2.54 * x, 1.27 * 2.5 + 2.54 * y, 1.6 - explode])
                rotate([0, 180, 0]) goldpin();
            translate([1.27 * 10 + 2.54 * x, 1.27 * 23.5 + 2.54 * y, 1.6 - explode])
                rotate([0, 180, 0]) goldpin();
        }
        translate([1.27 * 4, 1.27 * 2.5, -1.2]) color("Silver")
            cube([2.54, 1, 1]);
    }
}

module body(explode) {
    board();
    components(explode);
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

module robot(explode) {
    translate([20.75, 20.75, -2.1 + explode]) rotate(175) {
        leg(0, 0, 0, explode);
    }
    translate([-20.75, -20.75, -2.1 + explode]) rotate(-5) {
        leg(0, 0, 0, explode);
    }
    translate([20.75, -20.75, -2.1 + explode]) rotate(-175) mirror([0, 1, 0]) {
        leg(0, 0, 0, explode);
    }
    translate([-20.75, 20.75, -2.1 + explode]) rotate(5) mirror([0, 1, 0]) {
        leg(0, 0, 0, explode);
    }
    body(explode);
}

robot(0);
