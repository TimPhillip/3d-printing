$fn=60;
hh = 10;

module Frame(k) {
    cylinder(h=k, d=7);
}

module Loch(k) {
    translate([0,0,-0.5])
    cylinder(h=k+1, d=3.3);

}

difference() {  
    hull() {
        Frame(hh);
        translate([20,0,0])
        Frame(hh);
    }
    
    Loch(hh);
    translate([20,0,0])
    Loch(hh);
}