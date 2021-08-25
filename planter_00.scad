include <planter_base.scad>;

module planter_00() {
    module pillar(height) {
        linear_extrude(height) circle(4, $fn = 6);
        linear_extrude(height + 0.5) circle(3, $fn = 6);
        linear_extrude(height + 1) circle(2, $fn = 6);
        linear_extrude(height + 1.5) circle(1, $fn = 6);
    }
    union() {
        planter_base();
        for (i = [0:120:240]) {
            rotate(i) translate([28, 0]) {
                pillar(33);
                rotate(120) translate([6, cos(30)*4]) pillar(32);
                rotate(180) translate([6, cos(30)*4]) pillar(31);
            }
        }
    }
}

if (is_undef($demo)) {
    planter_00();
}
