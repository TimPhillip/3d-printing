module box(width, height, depth, wall){
    
    difference(){
        translate([wall,wall,0])
        minkowski(){
           cube([width, depth, height]);
           cylinder(r=wall, h=2*wall, $fn=64);
        }
        translate([wall, wall, wall])
        cube([width, depth, 2 * height]);
        
        
        rotate([0,90,0])
        translate([-height/2,depth/2+ wall,-width/2])
        cylinder(r=5, h=2*width);
        
    }
    
    translate([width/2, - depth/4 - wall,0])
    difference(){
        linear_extrude(wall)
        minkowski(){
            translate([wall - width/4, wall,0])
            square([width/2, depth/4]);
            circle(r=wall);
        }
        translate([width/6,depth/6,0])
        cylinder(r=3, h= 5*wall, center=true);
        translate([-width/6,depth/6,0])
        cylinder(r=3, h= 5*wall, center=true);
        translate([0,depth/6,0])
        cylinder(r=3, h= 5*wall, center=true);
    }
    
    translate([width/2, depth + wall,0])
    difference(){
        linear_extrude(wall)
        minkowski(){
            translate([wall - width/4, wall,0])
            square([width/2, depth/4]);
            circle(r=wall);
        }
        
        translate([width/6,depth/6,0])
        cylinder(r=3, h= 5*wall, center=true);
        translate([-width/6,depth/6,0])
        cylinder(r=3, h= 5*wall, center=true);
        translate([0,depth/6,0])
        cylinder(r=3, h= 5*wall, center=true);
    }
    
}

module deckel(width, height, depth, wall){
    
    difference(){
        union(){
            translate([wall,wall,0])
            linear_extrude(height)
            minkowski(){
               square([width, depth]);
               circle(r=wall, $fn=64);
            }
            translate([wall, wall, -wall])
            cube([width, depth, 2 * height]);
        }
        translate([width/2, depth/2,wall /2])
        linear_extrude(4*wall)
        text("LED", size=32, halign="center", valign="center");
    }
    
    
}

box(
    width=190,
    height=60,
    depth=55,
    wall=3
);

translate([0,0,80])
%deckel(
    width=190,
    height=3,
    depth=55,
    wall=3
);