$fn=50;

difference() {
    union(){
        cylinder(r=50, h=2);
        cylinder(r=37.5, h=30);
    }
    cylinder(r=10, h=30);
}



translate([120,0,0])
difference() {

    cylinder(r=50, h=2);
    cylinder(r=10, h=30);
}