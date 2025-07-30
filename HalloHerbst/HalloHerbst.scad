// Hallo Herbst

$fn=60;

 scale([6.0,6.0,1.0])
 linear_extrude(height = 10) {
        scale(0.15)
        import("Hallo Herbst.dxf");
    }