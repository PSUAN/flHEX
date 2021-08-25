include <planter_base.scad>;

module planter_01() {
    module brick() {
        union() {
            cube(2, center = true);
            translate([0, 0, 1.5]) rotate(45) cylinder(1, r1 = sqrt(2), r2 = 1.2, center = true, $fn = 4);
            translate([0, 0, -1.5]) rotate(45) cylinder(1, r1 = 1.2, r2 = sqrt(2), center = true, $fn = 4);
        }
    }
    
    module columns(brick_count) {
        union() {
            for (i=[0:1:brick_count-1]) {
                translate([0, 10, i*3]) brick();
                translate([0, -10, i*3]) brick();
            }
        }
    }
    
    module arch() {
        union() {
            columns(6);
            for (i = [0:15:180]) {
                translate([0, 0, 18]) rotate(i, [1, 0, 0]) translate([0, 10, 0]) brick();
            }
        }
    }
    
    union() {
        planter_base();
        translate([16, 0]) linear_extrude(24) circle(16, $fn = 6);
        translate([16, 0, 24]) rotate(15) {
            arch();
            translate([-3, 0, 0]) columns(5);
            translate([-6, 0, 0]) columns(3);
        }
    }
}

if (is_undef($demo)) {
    planter_01();
}
