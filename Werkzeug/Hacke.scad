// Edit this to change the handle radius
handle = 10;

difference(){
	difference(){
		union(){
			// Physical hoe
			polyhedron(
				points=[ [70,0,0],[235,0,0],[200,76.25,0],[105,76.25,0],[200,76.25,10],[105,76.25,10] ],
				faces=[ [0,1,2,3],[0,5,4,1],[0,3,5],[1,4,2],[3,2,4,5] ]
			);

			// Handle holder
			difference(){
				translate( [152.5,67,0] ){
					cylinder(h=70, r1=handle+5, r2=handle+5);
				}

				translate( [152.5,67,-1] ){
				cylinder(h=73, r1=handle, r2=handle);
				}
			}
		}
		translate( [152.5,67,-1] ){
			cylinder(h=71, r1=handle, r2=handle);
		}
	}

	rotate(a=[90,0,0]){
		translate( [152.5,40,-110] ){
			cylinder(h=80, r1=3, r2=3);
		}
	}
}