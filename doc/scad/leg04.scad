use <parts.scad>
use <tote.scad>

module leg(hip, knee, ankle, explode) {
    translate([0, 0, -explode * 2]) rotate(hip - 40) {
        coxa(0);
        translate([18, -22 - 0, -28.75]) rotate([90, 180, 90]) {
            translate([0, 0, explode * 2]) rotate(knee) {
                translate([0, 0, explode]) SG90_horn_screw();
                tibia(0);
                translate([35.2, 0, 0]) rotate([0, 0, 180]) {
                    translate([0, 0, explode]) SG90_horn_screw();
                    translate([0, 0, -explode * 2]) rotate(ankle) femur(0);
                }
            }
        }
    }
}

leg(0, 0, 0, 10);
