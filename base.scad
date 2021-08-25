module base() {
    module walls() {
        connector = 4;
        difference() {
            union() {
                circle(40, $fn = 6);
                for (i = [0:60:300]) {
                    rotate(i) translate([40, 0]) rotate(120) translate([10, 0]) rotate(30) circle(connector, $fn = 6);
                }
            }
            for (i = [0:60:300]) {
                rotate(i) translate([40, 0]) rotate(240) translate([10, 0]) rotate(30) circle(connector, $fn = 6);
            }
        }
    }
    union() {
        difference() {
            linear_extrude(16) walls();
            translate([0, 0, 4]) linear_extrude(16) circle(34, $fn = 6);
        }
        for (i = [0:60:300]) {
            rotate(i) translate([32, 0]) linear_extrude(8) circle(4, $fn = 6);
        }
    }
}

if (is_undef($demo)) {
    base();
}