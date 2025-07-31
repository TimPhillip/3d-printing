// Kantenschutz

module Dreieck() {

    difference(){
        cube([20,20,3],center=true);
        translate([-8,-6,0])
        rotate([0,0,45])
        cube([20,40,5],center=true);
        
    }
};
difference() {
    Dreieck();
    translate([-1,-1,0])
    cube([20,20,1],center=true);
}