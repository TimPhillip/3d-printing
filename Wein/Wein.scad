//Wein


$fn=100;

rotate_extrude(angle=360) 
Bottle();

module Bottle() {
    rotate([0,0,90])
    translate([-778,-163,0])
    import("Flasche3.dxf");
}