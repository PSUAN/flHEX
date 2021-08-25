module planter_00() {
    difference() {
        linear_extrude(32) circle(32, $fn=6);
        translate([0, 0, 4]) linear_extrude(32) circle(28, $fn = 6);
        linear_extrude(8) circle(2, $fn = 6);
        for (i = [0:60:300]) {
            linear_extrude(8) rotate(i) translate([8, cos(30)*4]) circle(2, $fn = 6);
        }
    }
}

if (is_undef($demo)) {
    planter_00();
}