slot = 1.4;
length = 60;
width = 15;
height_in = 3;
height_out = 5;
connector = 10;

difference(){
    union(){
        translate([2,2,1])
        minkowski(){
            cube([length - 4 + connector,width - 4,height_in - 2]);
            cylinder(h=2,r=2,center=true);
        }

        translate([0,0,height_in + slot])
        translate([2,2,1])
        minkowski(){
            cube([length - 4 + connector,width - 4,height_out - 2]);
            cylinder(h=2,r=2,center=true);
        }

        translate([2,2,1])
        minkowski(){
            cube([connector - 4, width - 4, height_in + height_out + slot - 2]);
            cylinder(h=2,r=2,center=true);
        }
    }

// holes
    translate([connector + 15 + 2.4,width / 2,0])
    cylinder(r=2.4,h=height_in+height_out+slot);
    
    translate([connector + 45 + 2.4,width / 2,0])
    cylinder(r=2.4,h=height_in+height_out+slot);
    
    translate([connector + 15 + 2.4,width / 2,height_in + slot + height_out /2])
    cylinder(r=4.9,h= height_out / 2);
    
    translate([connector + 45 + 2.4,width / 2,height_in + slot + height_out /2])
    cylinder(r=4.9,h= height_out / 2);

}

difference(){
    union(){
        translate([connector * 0.7,5,5 + height_in +slot])
        minkowski(){
            cube([2,width - 10,15]);
            rotate([0,90,0])
            cylinder(r=5,h=1,center=true);
        }

        translate([connector * 0.7 + 8,5,5 + height_in +slot])
        minkowski(){
            cube([2,width - 10,15]);
            rotate([0,90,0])
            cylinder(r=5,h=1,center=true);
        }
    }
    translate([0,width/2,22])
    rotate([0,90,0])
    cylinder(r=1.9,h=30);
}