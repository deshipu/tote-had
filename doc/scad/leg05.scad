use <parts.scad>
use <tote.scad>

module robot(explode) {
    translate([20.75, 20.75, -2.1 + explode]) rotate(175) {
        SG90_single_horn();
        translate([6, -0.1, 5.5 - 2*explode]) rotate([0, 180, 0]) SG90_horn_screw();
        translate([12, -0.2, 5.5 - 2*explode]) rotate([0, 180, 0]) SG90_horn_screw();
    }
    board();
    components(0);
}

robot(10);
