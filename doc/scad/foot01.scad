use <parts.scad>

difference() {
    SG90_cross_horn(0);
    translate([3.3, -10, -10]) color("Grey") cube([20, 20, 20]);
}

translate([5, 0, 0]) difference() {
    SG90_cross_horn(0);
    translate([3.3-30, -10, -10]) color("Grey") cube([30, 20, 20]);
}
