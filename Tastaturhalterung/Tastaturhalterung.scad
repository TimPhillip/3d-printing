// Tastaturhalterung


difference(){
    cube([160,20,90],true);
    translate([0,0,45/2])
    cube([45,21,45],true);
}



translate([0,-20,-90/2+5])
difference() {
    cube([160,30,10],true);
}

translate([0,20,90/2-5])
difference() {
    cube([160,30,10],true);
    cylinder(h=50,d=6,center=true);
    translate([60,0,0])
    cylinder(h=50,d=6,center=true);
    translate([-60,0,0])
    cylinder(h=50,d=6,center=true);

    translate([60,0,-4])
    cylinder(h=4,d=12,center=true);
    translate([-60,0,-4])
    cylinder(h=4,d=12,center=true);

    translate([0,0,0])
    cube([45,60,45],true);

}