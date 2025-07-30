// Buchtitel

translate([-39,103.5,0])
scale([0.35,0.515,0.5])
    linear_extrude(height=5,center = true, convexity = 10)
    import("Buchtitel/Buchtitel.svg", center = true, dpi = 96);
    
    
//    color("red")
//    Etikett();
    
module Etikett() {

    cube([70,30,1],center=true);
};