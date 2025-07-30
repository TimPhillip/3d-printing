// Flap Display
// Maße:
//https://www.etsy.com/de/listing/979720975/blank-split-flap-display-flaps?ref=shop_home_active_6&crt=1&logging_key=9a650166e245f943e279f7e6ffdac373a0184f96%3A979720975&variation0=1859267286&variation1=4936227715


a = 54;
b = 42.8;

module Flap() {
    
    difference() {
        FlapForm();
        translate([-(a-3)/2,b-15/2-1.8,0])
        FlapGap();
        translate([+(a-3)/2,b-15/2-1.8,0])
        FlapGap();
    }
}


module FlapGap() {
    cube([3.2,15,2],center=true);
}

module FlapForm() {
    hull() {
        translate([-(a-3)/2,1.5,0])
        cylinder(d=3,h=0.76,center=true,$fn=60);
        translate([+(a-3)/2,1.5,0])
        cylinder(d=3,h=0.76,center=true,$fn=60);
        
        translate([-(a-3)/2,b-1.5,0])
        cube([3,3,0.76],center=true);
        
        translate([+(a-3)/2,b-1.5,0])
        cube([3,3,0.76],center=true);
    }
}


Flap();