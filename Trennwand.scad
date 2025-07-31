// Trennwand für Kleinteile Box

l=64;
b=30;
t=1.5;

difference() {
    cube([b,l,t]);
    
    for (i=[0:1:4])
    translate([5*i+4,2,1])
    cube([2,l-4,3]);
}