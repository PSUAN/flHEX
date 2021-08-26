include <planter_base.scad>;

module planter_02() {
    difference() {
        planter_base();
        for (i=[0:60:300]) {
            rotate(i+15) translate([0, 0, 32]) rotate(90, [1, 0, 0]) rotate(30, [0, 0, 1]) cylinder(32, r = 12, $fn = 6);
        }
    }
}

if (is_undef($demo)) {
    planter_02();
}
