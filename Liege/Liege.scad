// Massageliege


module Bett() {
    cube([30,30,2],center=true);
}

module Liegeflaeche() {
    Bett();
    translate([29,0,5]) rotate([0,-20,0])Bett();
    translate([58,0,10]) Bett();
    
}

module Bein() {
    cylinder(d=4,h=20, center=true);
}

module Langbein() {
    cylinder(d=4,h=30, center=true);
}

Liegeflaeche();
translate([-5,10,-10]) Bein();
translate([-5,-10,-10]) Bein();
translate([60,10,-5]) Langbein();
translate([60,-10,-5]) Langbein();