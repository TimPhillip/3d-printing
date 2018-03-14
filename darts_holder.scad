union(){
    cube([50,120,3],center= true);
    translate([0,45,0])
    holder_set();
    translate([0,15,0])
    holder_set();
    translate([0,-15,0])
    holder_set();
    translate([0,-45,0])
    holder_set();
}



module holder(){
    difference(){
        cylinder(h=50,r=6);
        translate([0,0,2])
        cylinder(h=50,r=5);
    }
};

module holder_set(){
    union(){
        translate([0,5,0])
        holder();
        rotate([-10,-10,30])
        translate([-10,0,4])
        holder();
        rotate([-10,10,-30])
        translate([10,0,4])
        holder();
        translate([0,0,2])
        cube([34,24,3],center= true);
    }
}