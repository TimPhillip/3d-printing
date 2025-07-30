/*

Dominoes

Carles Oriol i Margarit

*/

width=2.06;
height=4.135;

depth=1.08;
separatorWidht=.06;

depthwhite=depth*42/100;
depthblack=depth-depthwhite;

dotmargin=.45;

dotsize=.5;

fullposition = 2;

$fn=16;

 fulldomino( fullposition );

//domino(1,6);

 module fulldomino( fullposition = 0 )
{
   
    for(v1=[0:6])
    for(v2=[v1:6])
    {
        if( fullposition == 0) // piramid
            translate([v2*width*1.5, v1*height*1.25,0]) domino(v1, v2);
        
       if( fullposition == 1) // square
            translate([(_piecenum(v1,v2)%7)*width*1.5, 
                        floor(_piecenum(v1,v2)/7)*height*1.25,0]) domino(v1, v2);
       
        if( fullposition == 2) // inbox
            translate([(_piecenum(v1,v2)%7)*width*1.1,0, 
                        floor(_piecenum(v1,v2)/7)*(depth+(dotsize/2))*1.01]) domino(v1, v2);
    }

}

_piecemax=6;
_piecemaxsum=_piecemax*(_piecemax+1)/2;
function _piecenum (v1,v2) = 
    _piecemaxsum-((_piecemax-v1)*((_piecemax-v1)+1)/2)+v2;



module domino( v1, v2 )
{

    // black
    color([0,0,0]) 
    difference()
    {
    //cube([width,height, depthblack]);
    {
    translate([0,height,depthblack]) rotate([180,0,0]) toprbox( width,height, depthblack,width/16 );
    }
    

    {
    translate([-separatorWidht/2,0,depthblack-separatorWidht]) cube([separatorWidht,height,separatorWidht]);   
            translate([width-separatorWidht/2,0,depthblack-separatorWidht]) cube([separatorWidht,height,separatorWidht]);   
        
      translate([0, -separatorWidht/2,depthblack-separatorWidht])    cube([width,separatorWidht,separatorWidht]);   
              
       translate([0, height-separatorWidht/2,depthblack-separatorWidht])    cube([width,separatorWidht,separatorWidht]);  
    }
}

    
    difference()
    {
    color([1,1,1]) translate([0,0,depthblack]) 
        //cube([width,height, depthwhite]);
        toprbox( width,height, depthwhite,width/16 );
    
    // separator
    color([0,0,0]) 
    translate([width/2, height/2, depth]) 
    //cube([width,separatorWidht, separatorWidht], center=true);
    rotate([-1,90,0]) cylinder(r=separatorWidht/2, h=width +2, center=true);
        
       color([0,0,0]) domino_number( v1 );
       color([0,0,0]) translate ([0,height/2,0]) domino_number( v2 );
    }
    
    // support dot
    color([0.71875,	0.44921875,	0.19921875])
    translate([width/2, height/2, depth]) sphere(r=dotsize/2);

    
    
}


// dots

module domino_number( n )
{
    
    dotpos =  depth+dotsize/4;

    if( n > 1 )
    {
        translate([dotmargin, dotmargin, dotpos]) sphere(r=dotsize/2);
        translate([width-dotmargin, width-dotmargin, dotpos]) sphere(r=dotsize/2);
    }
    
    if( n >= 4 ) 
    {
        translate([width-dotmargin, dotmargin, dotpos]) sphere(r=dotsize/2);    
        translate([dotmargin, width-dotmargin, dotpos]) sphere(r=dotsize/2);
    }
    
    // six pair
    if( n == 6 )
    {
        translate([dotmargin, width/2, dotpos]) sphere(r=dotsize/2);
        translate([width-dotmargin, width/2, dotpos]) sphere(r=dotsize/2);
    }
    
    // central
    if( n%2==1 ) // evens
        translate([width/2, width/2, dotpos]) sphere(r=dotsize/2);
}

module toprbox( w, h, d, topradius )
{
    
    hull()
    {
    hull()
    {
    translate([topradius,topradius,d-topradius]) sphere( r=topradius );
    translate([w-topradius,topradius,d-topradius])  sphere( r=topradius );
    translate([w-topradius,h-topradius,d-topradius]) sphere( r=topradius );
    translate([topradius,h-topradius,d-topradius]) sphere( r=topradius );
    }
    
    hull()
    {
    translate([topradius,topradius,0]) cylinder( r=topradius, d-topradius );
    translate([w-topradius,topradius,0]) cylinder( r=topradius, d-topradius );
    translate([w-topradius,h-topradius,0])cylinder( r=topradius, d-topradius );
    translate([topradius,h-topradius,0]) cylinder( r=topradius, d-topradius );
    }
}
}
