// Tipp-Kick Fussballer

module Fussballer_roh() {
    s=0.4;
    scale([s,s,s])
    translate([-184,-21,148])
    import ("football_player.stl");
}


module Fussballer() {
    union()
    difference() {
        Fussballer_roh();
        translate([-13.0,-18,6])
        sphere(8);
        translate([0,0,1])
        cube([200,200,4],center=true);
    }
    
    translate([0,0,1.5])
    cube([50,50,4],center=true);
}


Fussballer();