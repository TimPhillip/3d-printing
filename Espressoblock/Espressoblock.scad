// Epressoblock

module outerCube() {
    minkowski() {
       square([54,31],center=true);
       circle(r=1,$fn=60);
    }

}

difference(){
    linear_extrude(5)
    outerCube();
    translate([0,1.5,6])
    #cube([50,30,6],center=true);
}