module horn(hornLaenge = 34.4,
            hornHoehe = 1.4,
            loecher = false) {
    
    difference(){
        union(){
            hull(){
                translate([0,- hornLaenge/2 +2,0])
                cylinder(r=2,h=hornHoehe, $fn=8);
                translate([0,hornLaenge/2 -2,0])
                cylinder(r=2,h=hornHoehe, $fn=8);
                
                cylinder(r=6.84/2,h= hornHoehe);
            };
            
            hull(){
                translate([16.62 / 2 - 1.85,0,0])
                cylinder(r=1.85,h = hornHoehe, $fn=8);
                translate([-16.62 / 2 + 1.85,0,0])
                cylinder(r=1.85,h = hornHoehe, $fn=8);
            };
        
            cylinder(r=6.84/2,h= 3.9);
        };
        if (loecher){
            translate([0,0,hornHoehe])
            cylinder(d=4.5, h = 30);
            cylinder(d=2.0, h=30, center=true);
        }
    };
}

horn();