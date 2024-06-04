$fn = 200; // Higher value for more resolution

FOOT_RADIUS = 5;
EYE_RADIUS = 2;

module body(length = 25, width = 15) {
    translate([0, length, 0])
    scale([width, length, width])
    sphere(r = 1);
}

module eye(x_offset) {
    y_offset = 4 + EYE_RADIUS;
    z_offset = 5 + EYE_RADIUS;
    translate([x_offset, y_offset, z_offset])
    sphere(r = EYE_RADIUS);
}

module eyes() {
    x_offset = 4 + EYE_RADIUS;
    eye(-x_offset);
    eye(x_offset);
}

module nose(length = 1.5, width = 1) {
    translate([0, 2.5, 5 + width])
    scale([length, width, width])
    sphere(r = 1); 
}

module foot(x_offset, y_offset) {
    translate([x_offset, y_offset, 0])
    sphere(r = FOOT_RADIUS);
}

module pair_of_feet(x_offset, y_offset) {
    x_offset = x_offset + FOOT_RADIUS;
    y_offset = y_offset + FOOT_RADIUS;
    foot(x_offset, y_offset);
    foot(-x_offset, y_offset);
}

module feet() {
    pair_of_feet(8, 13);
    pair_of_feet(6, 34);
}

module critter() {
    body();
    eyes();
    nose();
    feet();
}

module cut_below_xy_plane(inf = 1000) {
    translate([-inf / 2, -inf / 2, -inf])
    cube([inf, inf, inf]);
}

difference() {
    critter();
    cut_below_xy_plane();
}
