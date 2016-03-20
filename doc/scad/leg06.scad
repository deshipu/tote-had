use <parts.scad>
use <tote.scad>

module robot(explode) {
    translate([20.75, 20.75, -2.1]) rotate(175) {
        SG90_single_horn();
        translate([6, -0.1, 5.5]) rotate([0, 180, 0]) SG90_horn_screw();
        translate([12, -0.2, 5.5]) rotate([0, 180, 0]) SG90_horn_screw();
    }
    translate([20.75, 20.75, -2.1 + explode]) rotate(175) {
        translate([0, 0, explode]) SG90_horn_screw();
        leg(0, 0, 0, explode);
    }
    board();
    components(0);
}

module leg(hip, knee, ankle, explode) {
    translate([0, 0, -explode * 2]) rotate(hip - 40) {
        coxa(0);
        translate([18, -22 - 0, -28.75]) rotate([90, 180, 90]) {
            translate([0, 0, 0 * 2]) rotate(knee) {
                translate([0, 0, 0]) SG90_horn_screw();
                tibia(0);
                translate([35.2, 0, 0]) rotate([0, 0, 180]) {
                    translate([0, 0, 0]) SG90_horn_screw();
                    translate([0, 0, -0 * 2]) rotate(ankle) femur(0);
                }
            }
        }
    }
}

robot(10);
