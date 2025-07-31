module Fluegel() {
    union() {
        translate([-698,-224,0])
        linear_extrude(height = 2) {
                import("Fluegel1.dxf");
        }
    }
    
}
rotate([0,-45,0])
Fluegel();