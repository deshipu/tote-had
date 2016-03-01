module wkLiPo238() {
    rotate(90) {
        color("Slate") hull() {
            translate([0, 6.5, 0]) rotate([0, 90, 0]) cylinder(r=3.4, h=32);
            translate([0, -6.5, 0]) rotate([0, 90, 0]) cylinder(r=3.4, h=32);
        }
        color("Red") translate([1, 8.5, -1]) rotate([0, -90, 0]) cylinder(r1=0.75, r2=0, h=20);
        color("Black") translate([1, 8.5, 1]) rotate([0, -90, 0]) cylinder(r1=0.75, r2=0, h=20);
    }
}

module capacitor() {
    difference() {
        color("DodgerBlue") {
            translate([0, 0, 3]) cylinder(r=3, h=7, $fn=20);
            translate([0, 0, 1]) cylinder(r=3, h=1, $fn=20);
            translate([0, 0, 2]) cylinder(r=2.7, h=1, $fn=20);
        }
        color("Silver") {
            translate([0, 0, 9.7]) cylinder(r=1.8, h=1, $fn=20);
            translate([0, 0, 0.3]) cylinder(r=2.5, h=1, $fn=20);
        }
    }
    color("DarkGray") {
        translate([1, 1, -1]) cylinder(r=0.3, h=2.5, $fn=4);
        translate([-1, -1, -1]) cylinder(r=0.3, h=2.5, $fn=4);
    }
}

module rc_servo_plug() {
    color("Orange") translate([1.27, 1.27, 12]) cylinder(r1=0.75, r2=0, h=20);
    color("Red") translate([1.27, 1.27 + 2.54, 12]) cylinder(r1=0.75, r2=0, h=20);
    color("Brown") translate([1.27, 1.27 + 2.54 * 2, 12]) cylinder(r1=0.75, r2=0, h=20);
    color("DimGray") difference() {
        cube([2.54, 2.54 * 3, 12]);
        translate([-1, -1, -1]) cube([1.25, 2.54 * 3 + 2, 7]);
        rotate(45) cube([1, 2, 12], center=true);
        translate([0, 2.54*3, 0]) rotate(-45) cube([1, 2, 12], center=true);
        for (y = [0:2]) {
            translate([1.27, 1.27 + y * 2.54, -1]) cylinder(r=0.5, h=12);
        }
    }
}

module arduino_pro_mini() {
    difference() {
        union() {
            color("Teal") cube([17.8, 33.0, 1.0]);
            color("Gold") {
                for (y = [0:11]) {
                    translate([1.27, 1.27 + 2.54 * y, 0.5]) {
                        cylinder(r=1, h=1.2, center=true, $fn=8);
                    }
                    translate([17.8 - 1.27, 1.27 + 2.54 * y, 0.5]) {
                        cylinder(r=1, h=1.2, center=true, $fn=8);
                    }
                }
                for (x = [0:5]) {
                    translate([2.54 + 2.54 * x, 33.0 - 1.27, 0.5]) {
                        cylinder(r=1, h=1.2, center=true, $fn=8);
                    }
                }
                for (y=[3, 4, 7, 8]) {
                    translate([17.8 - 2.54 - 1.27, 2.54 * y, 0.5]) {
                        cylinder(r=1, h=1.2, center=true, $fn=8);
                    }
                }
            }
            color("DimGray") {
                translate([8.9, 9.1, 0.5]) rotate(45) cube([7, 7, 1]);
                translate([8.2, 22, 1]) cube([1.6, 3.8, 1]);
            }
            color("Orange") {
                translate([12, 23, 1]) cube([2, 4, 1]);
                translate([17.8 - 14, 23, 1]) cube([2, 4, 1]);
            }
            translate([8.9, 3.5, 0.5]) {
                rotate(22.5) color("Silver") cylinder(r=3, h=0.75, $fn=8);
                rotate(22.5) color("LightGray") cylinder(r=2.5, h=1, $fn=8);
                color("Gold") cylinder(r=1.2, h=1.5, $fn=8);
            }
        }
        color("Gold") {
            for (y = [0:11]) {
                translate([1.27, 1.27 + 2.54 * y, 0.5]) {
                    cylinder(r=0.4, h=1.4, center=true, $fn=8);
                }
                translate([17.8 - 1.27, 1.27 + 2.54 * y, 0.5]) {
                    cylinder(r=0.4, h=1.4, center=true, $fn=8);
                }
            }
            for (x = [0:5]) {
                translate([2.54 + 2.54 * x, 33.0 - 1.27, 0.5]) {
                    cylinder(r=0.4, h=1.4, center=true, $fn=8);
                }
            }
            for (y=[3, 4, 7, 8]) {
                translate([17.8 - 2.54 - 1.27, 2.54 * y, 0.5]) {
                    cylinder(r=0.4, h=1.4, center=true, $fn=8);
                }
            }
        }
    }
}

module SG90_horn_screw() {
    color("DarkGray") union() {
        translate([0, 0, 3.4]) difference() {
            union() {
                cylinder(r=1.3, h=0.9, $fn=8);
                translate([0, 0, -4.4]) cylinder(r1=0, r2=0.8, h=5, $fn=8);
            }
            translate([-0.25, -1, 0.4]) cube([0.5, 2, 1]);
            translate([1, -0.25, 0.4]) rotate(90) cube([0.5, 2, 1]);
        }
    }
}

module SG90_mount_screw() {
    color("DarkGray") union() {
        translate([0, 0, 3.4]) difference() {
            union() {
                cylinder(r=1.4, h=0.9, $fn=8);
                translate([0, 0, -7.4]) cylinder(r1=0, r2=0.8, h=8, $fn=8);
                cylinder(r=1.8, h=0.2, $fn=8);
            }
            translate([-0.25, -1, 0.4]) cube([0.5, 2, 1]);
            translate([1, -0.25, 0.4]) rotate(90) cube([0.5, 2, 1]);
        }
    }
}

module SG90() {
    servo_height = 22.6;
    servo_width = 12.2;
    servo_depth = 22.8;
    servo_ear_depth = 4.8;
    servo_big_tip_r = 6.05;

    translate([-6.0, -16.9, -servo_height - 5.8 - 1]) union() {
        color("RoyalBlue", 0.75) union () {
            cube([servo_width, servo_depth, servo_height]);
            translate([0, -4.8, 17.6]) {
                difference () {
                    cube([12.0, 32.3, 2.4]);
                    translate([6.0, 1.5, -0.1]) cylinder(r=2, h=2.6, $fn=10);
                    translate([6.0, 30.8, -0.1]) cylinder(r=2, h=2.6, $fn=10);
                }
            }
            translate([6.0, 16.9, servo_height]) {
                cylinder(r=servo_big_tip_r, h=5.8, $fn=20);
            }
            translate([6.0, 16.9 - servo_big_tip_r, servo_height]) {
                cylinder(r=2.75, h=5.8, $fn=10);
            }
        }
        color("Snow") translate([6.0, 16.9, servo_height + 5.8]) difference() {
            cylinder(r=2.275, h=3.9, $fn=6);
            cylinder(r=0.8, h=5, $fn=10);
        }
    }
    translate([1, -10, -25]) rotate([0, 90, 90]) {
        color("Orange") translate([1.27, 0, 12]) cylinder(r1=0.75, r2=0, h=20);
        color("Red") translate([1.27, 1, 12]) cylinder(r1=0.75, r2=0, h=20);
        color("Brown") translate([1.27, 2, 12]) cylinder(r1=0.75, r2=0, h=20);
    }
}

module _SG90_horn_arm() {
    difference() {
        translate([13.8, 0, 3.1]) {
            cylinder(r=1.85, h=1.3, $fn=10);
            translate([0,-2,0]) rotate([0,0,94]) {
                cube([4, 13.8, 1.3]);
            }
            translate([0,-2,0]) rotate([0,0,86]) {
                cube([4, 13.8, 1.3]);
            }
        }
        for(i=[0:5]) {
            translate([13.8 - i * 2,0,0]) {
                cylinder(r=0.6, h=8, $fn=8);
            }
        }
    }
}

module SG90_single_horn(angle) {
    rotate(angle) color("Snow") {
        difference() {
            union() {
                cylinder(r=3.3, h=4.4, $fn=20);
                _SG90_horn_arm();
            }
            translate([0,0,-1]) {
                cylinder(r=2.275, h=3.2, $fn=6);
                cylinder(r=1, h=8, $fn=10);
                translate([0, 0, 4.4]) cylinder(r=2.35, h=2, $fn=10);
            }
        }
    }
}

module SG90_double_horn(angle) {
    rotate(angle) color("Snow") {
        difference() {
            union() {
                cylinder(r=3.3, h=4.4, $fn=20);
                _SG90_horn_arm();
                rotate(180) _SG90_horn_arm();
            }
            translate([0,0,-1]) {
                cylinder(r=2.275, h=3.2, $fn=6);
                cylinder(r=1, h=8, $fn=10);
                translate([0, 0, 4.4]) cylinder(r=2.35, h=2, $fn=10);
            }
        }
    }
}

module switch() {
    color("Silver") cube([2.54 * 3, 2.54 * 2, 2.54 * 2]);
    color("SteelBlue") translate([2.54, 2.54 * 2, 1.27]) cube([2.54 * 1, 2.54 * 1, 2.54 * 1]);
    color("Gold") for (x = [0:2]) {
        translate([2.54 * x + 1.27, 1.27, 2.54 * 2]) cube([0.5, 0.5, 2.54], center=true);
    }
}

module goldpin() {
    color("Gold") translate([0, 0, -0.5]) rotate(45) cylinder(r=0.3, h=8.47, $fn=4);
    color("DimGray") translate([0, 0, 1]) rotate(22.5) cylinder(r=1.4, h=1.5, $fn=8);
}

module pin_socket(pins) {
    color("DimGray") difference() {
        translate([0, 0, -2.54 * 3]) cube([2.54, 2.54 * pins, 2.54 * 2.5]);
        for (pin = [0:pins - 1]) {
            translate([1.27 * 0.5, 1.27 * 0.5 + 2.54 * pin, -2.54 * 2])
                cube([1.27, 1.27, 2.54 * 2]);
        }
    }
    color("Gold") for (pin = [0:pins - 1]) {
        translate([1.27 * 0.75, 1.27 * 0.75 + 2.54 * pin, -2.54 * 3.5])
            cube([1.27 * 0.5, 1.27 * 0.5, 1.27]);
    }
}
