// Terrasse Unterkonstruktion


module Latte(L) {
    
    cube([5,L,7],center=true);
    
}


module Latten() {
    
    for (i=[0:30:250]) {
        translate([i,0,0])
        Latte(190);
    }
}
translate([250/2-2.5,-190/2-2.5,0])
rotate([0,0,90])
Latte(250);
Latten();
translate([250/2-2.5,190/2+2.5,0])
rotate([0,0,90])
Latte(250);
