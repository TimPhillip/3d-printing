// Filament Schild


module Winkel() {
    
    difference() {
        cube([20,50,20],center=true);
        translate([3,0,0])
        cube([15,60,15],center=true);
    }
}

module Schrift(Text) {
    linear_extrude(4)
    text(Text,halign="center");
}

module Oval(xx,yy,zz) {
    translate([-yy/2,0,0])
    cylinder(d=xx,zz,center=true,$fn=60);
    translate([yy/2,0,0])
    cylinder(d=xx,zz,center=true,$fn=60);
    cube([yy,xx,zz],center=true);
}

module Rahmen(){
    difference(){
        Oval(17,32,5);
        Oval(16,31,6);
    }
}

module Schild() {
    difference(){
        Winkel();
        rotate([-90,0,90])
        translate([0,0,8])
        Rahmen();
        rotate([-90,0,90])
        translate([0,-5,6])
        Schrift("PVB");}
    }
/*    
Schild();
*/
color("Black") {
    rotate([-90,0,90])
    translate([0,0,7.55])
    Rahmen();
    rotate([-90,0,90])
    translate([0,-5,6.05])
    Schrift("PVB");
}
