$demo = true;
include <base.scad>;
include <planter_00.scad>;
include <planter_01.scad>;
include <planter_02.scad>;

module step(angle, radius) {
    rotate(angle*60) translate(radius*[60, cos(30)*40]) children();
}

module lift(height) {
    translate([0, 0, height]) children();
}

module pair() {
    base();
    translate([0, 0, 8]) children();
}

pair();
lift(1) step(0, 1) pair() planter_00();
lift(2) step(1, 1) pair() planter_01();
lift(1) step(2, 1) pair() planter_02();
