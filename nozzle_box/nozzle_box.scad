sizes = ["1.0","0.8","0.6","0.5", "0.4", "0.3","0.2"];

difference(){
    union(){
        minkowski(){
            cube([81,28,4]);
            sphere(r=2);
        }
        
        for(i = [0:1:6]){
            translate([i * 12 - 1,22,5.5])
            color("green")
            linear_extrude(1.5)
            text(sizes[i],size=5.5,center = true);
        }
    }
    
    for(i= [0:1:6]){
        translate([4 + i * 12,16,0])
        cylinder(h=8,r=3.3);
        translate([4 + i * 12,4,0])
        cylinder(h=8,r=3.3);
    }
    
}
    