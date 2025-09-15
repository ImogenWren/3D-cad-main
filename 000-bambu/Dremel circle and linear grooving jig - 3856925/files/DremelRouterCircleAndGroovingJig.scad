//As sliding bard I use 8mm aluminum tubes that are light and have a good strength, but it can be anything round, even threaded bars can be ok.
//The nuts grips have to be a tight fit, I pressed mine on the nuts using a wrench.
//To lock the horizontal sliders there are two plates, each with 3 screws (tapping screws should be fine). Just tight the external screws enough to let the sliders move when the middle one is loose...tighten the middle one when you want to lock the position.
//Part 1 is the dremel holder, Part2 is the base, part 3 is the circle grooving pivot plate, part 4 are the sliders clamps, part 5 are the grip nuts, part 6 an aligment guide for cornerside linear grooving, part7 is a linear grooving guide to be used against a reference fence, part8 are side handles.
//The side guide and the circle jig need their own sets of sliders as the rods have to be glued in the jigs holes. In the view both jigs are on the same rods only for viewing purposes.
//Part required for a complete kit are 1 of part1, 1 of part2, 1 of part3, 2 of part4, 4 of part5, 1 of part6.
//Hardware required is 2 pieces of M8 threaded bar of 100-150mm long, 4 pieces of 8mm round rod or tube long as your preference, 8 M8 nuts, 6 M4x25mm hex head screws, 6 M4 wingnuts, 6 4mm washers and some CA glue to lock the horizontal sliders into the jigs.
//Minimum circle diameter using the sliding jig is 85mm, for smaller radiuses there are 3mm holes arrays in the corners that provide pivoting radius starting from 2.5,5,7.5,10mm and increasing in 10mm steps. The minimum radius depends on the middle hole diameter size. I suggest marking the holes with a permanent marker to know the respective sizes.
//There are four holes near the corners where it can be mounted two bearings at opposite corners to cut grooves in the exact middle of posts or planks with a maximum width of about 100mm (ShowAll=4 for example).

$fn=72;

FixingPlateMiddleDiameter=35; //Diameter of the middle part of the dremel holding plate
FixingPlateThickness=15;

VerticalSlidesDiameter=8.25;
VerticalSlidesNutSize=15; //Maximum diameter of nut
VerticalSlidesNutHeight=6.5; //Height of one nut (at thge bottom of the sliding bar there are two nuts)

VerticalSlidesGuideLength=25;
VerticalSlidesInteraxis=100;

BaseMiddleDiameter=VerticalSlidesInteraxis*1.24; //Diameter of rounded sides
BasePlateThickness=20; //Including height of threaded bars supports
BaseMiddleHoleDiameter=25; //Through hole for tool
BaseMiddleHoleRecessDiameter=45; //Top diameter of through hole for tool
BaseSideSquaringWidth=70;

//Horizontal sliders clamp holes are for M4 hex head screws fitted from the bottom. On top is best to have wingnuts for quick locking.
PivotingHoleDiameter=3;
HorizontalSlidesDiameter=8;
HorizontalSlidesInteraxis=40;
HorizontalSlidesLength=200;

SidePlateLength=150;
SidePlateThickness=15;

Part=0;
ShowAll=4;  //0=no  1=with circle jig   2=with corner jig   3= with side jig  4=Centering bearings
ShowDremel=1;
module Part1()
difference()
{
	union()
	{
		hull()
		{
			translate([0,0,2.5])
				cylinder(d=FixingPlateMiddleDiameter,h=10,center=true);

			translate([0,-VerticalSlidesInteraxis/2,0])
				cylinder(d=VerticalSlidesDiameter+8,h=FixingPlateThickness,center=true);
		}
		hull()
		{
			translate([0,0,2.5])
				cylinder(d=FixingPlateMiddleDiameter,h=10,center=true);

			translate([0,VerticalSlidesInteraxis/2,0])
				cylinder(d=VerticalSlidesDiameter+8,h=FixingPlateThickness,center=true);
		}

		translate([0,VerticalSlidesInteraxis/2,-VerticalSlidesGuideLength/2+7.5])
			cylinder(d=VerticalSlidesDiameter+8,h=VerticalSlidesGuideLength,center=true);
		translate([0,-VerticalSlidesInteraxis/2,-VerticalSlidesGuideLength/2+7.5])
			cylinder(d=VerticalSlidesDiameter+8,h=VerticalSlidesGuideLength,center=true);

	}

	translate([0,VerticalSlidesInteraxis/2,-VerticalSlidesGuideLength/2])
		cylinder(d=VerticalSlidesDiameter,h=VerticalSlidesGuideLength*2,center=true);
	translate([0,-VerticalSlidesInteraxis/2,-VerticalSlidesGuideLength/2])
		cylinder(d=VerticalSlidesDiameter,h=VerticalSlidesGuideLength*2,center=true);

	translate([0,0,-FixingPlateThickness/2+0.01])
		linear_extrude(twist=-360*8,height=FixingPlateThickness+0.02)
			translate([0.75,0,0])
				circle(d=19);
	
	translate([0,0,-8.3])
		cylinder(d=27,h=10,center=true);
	
}

module Part2()
	rotate([0,0,0])
		translate([0,0,0])
			difference()
			{
				union()
				{
//Base plate
					translate([0,0,-BasePlateThickness/4])
						cylinder(d=BaseMiddleDiameter,h=BasePlateThickness/2,center=true);

//Slides support
					hull()
					{
						translate([0,-VerticalSlidesInteraxis/3,-BasePlateThickness/2+0.5])
						cylinder(d=BaseMiddleHoleRecessDiameter,h=1,center=true);

						translate([0,-VerticalSlidesInteraxis/2,0])
							cylinder(d=VerticalSlidesDiameter+15,h=BasePlateThickness,center=true);
					}
					hull()
					{
						translate([0,VerticalSlidesInteraxis/3,-BasePlateThickness/2+0.5])
						cylinder(d=BaseMiddleHoleRecessDiameter,h=1,center=true);

						translate([0,VerticalSlidesInteraxis/2,0])
							cylinder(d=VerticalSlidesDiameter+15,h=BasePlateThickness,center=true);
					}
				}
		
//Handles fixing holes
		translate([0,VerticalSlidesInteraxis/2+9,0])
			cylinder(d=2.5,h=50,center=true);
		translate([0,VerticalSlidesInteraxis/2-9,0])
			cylinder(d=2.5,h=50,center=true);
		translate([0,-VerticalSlidesInteraxis/2+9,0])
			cylinder(d=2.5,h=50,center=true);
		translate([0,-VerticalSlidesInteraxis/2-9,0])
			cylinder(d=2.5,h=50,center=true);
				
//Centering bearings grooving
			rotate([0,0,67])
				translate([BaseMiddleDiameter/2-7,0,0])
					cylinder(d=4,h=BasePlateThickness*2,center=true);
			rotate([0,0,-67])
				translate([BaseMiddleDiameter/2-7,0,0])
					cylinder(d=4,h=BasePlateThickness*2,center=true);
			rotate([0,0,67-180])
				translate([BaseMiddleDiameter/2-7,0,0])
					cylinder(d=4,h=BasePlateThickness*2,center=true);
			rotate([0,0,-67-180])
				translate([BaseMiddleDiameter/2-7,0,0])
					cylinder(d=4,h=BasePlateThickness*2,center=true);
			
//Circle cutting fixed holes			
			rotate([0,0,59])
			{
				for(a=[0:10:BaseMiddleDiameter/2-5])
					translate([a,0,0])
						cylinder(d=3,h=BasePlateThickness*2,center=true);
			}
			
			rotate([0,0,-59])
			{
				for(a=[2.5:10:BaseMiddleDiameter/2-5])
					translate([a,0,0])
						cylinder(d=3,h=BasePlateThickness*2,center=true);
			}
			
			rotate([0,0,-59-180])
			{
				for(a=[5:10:BaseMiddleDiameter/2-5])
					translate([a,0,0])
						cylinder(d=3,h=BasePlateThickness*2,center=true);
			}
			
			rotate([0,0,59-180])
			{
				for(a=[7.5:10:BaseMiddleDiameter/2-5])
					translate([a,0,0])
						cylinder(d=3,h=BasePlateThickness*2,center=true);
			}

			//Vertical threaded bar passage
				translate([0,VerticalSlidesInteraxis/2,0])
					cylinder(d=VerticalSlidesDiameter,h=VerticalSlidesGuideLength+2,center=true);
				translate([0,-VerticalSlidesInteraxis/2,0])
					cylinder(d=VerticalSlidesDiameter,h=VerticalSlidesGuideLength+2,center=true);

			// Nuts recess in base bottom
				translate([0,VerticalSlidesInteraxis/2,-BasePlateThickness/2+VerticalSlidesNutHeight+1])
					cylinder(d=VerticalSlidesNutSize,h=VerticalSlidesNutHeight*2+3,center=true,$fn=6);
				translate([0,-VerticalSlidesInteraxis/2,-BasePlateThickness/2+VerticalSlidesNutHeight+1])
					cylinder(d=VerticalSlidesNutSize,h=VerticalSlidesNutHeight*2+3,center=true,$fn=6);

			//Tool opening into base
				translate([0,0,0])
					cylinder(d=BaseMiddleHoleDiameter,h=BasePlateThickness+2,center=true);
				translate([0,0,5])
					scale([1,1,1])
						cylinder(d=BaseMiddleHoleRecessDiameter,h=BasePlateThickness+2,center=true);

			//Side squaring
				translate([500+BaseSideSquaringWidth/2,0,0])
					cube([1000,1000,1000],center=true);
				translate([-500-BaseSideSquaringWidth/2,0,0])
					cube([1000,1000,1000],center=true);

			//Holes for attachments		
				translate([BaseSideSquaringWidth/2-7.5,HorizontalSlidesInteraxis/2+HorizontalSlidesDiameter,0])
					cylinder(d=4.25,h=35,center=true);
				translate([BaseSideSquaringWidth/2-7.5,-HorizontalSlidesInteraxis/2-HorizontalSlidesDiameter,0])
					cylinder(d=4.25,h=35,center=true);
				translate([-BaseSideSquaringWidth/2+7.5,HorizontalSlidesInteraxis/2+HorizontalSlidesDiameter,0])
					cylinder(d=4.25,h=35,center=true);
				translate([-BaseSideSquaringWidth/2+7.5,-HorizontalSlidesInteraxis/2-HorizontalSlidesDiameter,0])
					cylinder(d=4.25,h=35,center=true);
				translate([BaseSideSquaringWidth/2-7.5,0,0])
					cylinder(d=4.25,h=35,center=true);
				translate([-BaseSideSquaringWidth/2+7.5,0,0])
					cylinder(d=4.25,h=35,center=true);
//Recess for screw heads
				translate([BaseSideSquaringWidth/2-7.5,HorizontalSlidesInteraxis/2+HorizontalSlidesDiameter,-BasePlateThickness/2])
					cylinder(d=8,h=7,center=true,$fn=6);
				translate([BaseSideSquaringWidth/2-7.5,-HorizontalSlidesInteraxis/2-HorizontalSlidesDiameter,-BasePlateThickness/2])
					cylinder(d=8,h=7,center=true,$fn=6);
				translate([-BaseSideSquaringWidth/2+7.5,HorizontalSlidesInteraxis/2+HorizontalSlidesDiameter,-BasePlateThickness/2])
					cylinder(d=8,h=7,center=true,$fn=6);
				translate([-BaseSideSquaringWidth/2+7.5,-HorizontalSlidesInteraxis/2-HorizontalSlidesDiameter,-BasePlateThickness/2])
					cylinder(d=8,h=7,center=true,$fn=6);
				translate([BaseSideSquaringWidth/2-7.5,0,-BasePlateThickness/2])
					cylinder(d=8,h=7,center=true,$fn=6);
				translate([-BaseSideSquaringWidth/2+7.5,0,-BasePlateThickness/2])
					cylinder(d=8,h=7,center=true,$fn=6);
					
				translate([0,HorizontalSlidesInteraxis/2,0])
					rotate([0,90,0])
						cylinder(d=HorizontalSlidesDiameter+0.25,h=200,center=true);
				translate([0,-HorizontalSlidesInteraxis/2,0])
					rotate([0,90,0])
						cylinder(d=HorizontalSlidesDiameter+0.25,h=200,center=true);
			}

//Center jig plate
module Part3()
	translate([0,0,0])
	difference()
	{
		union()
		{
			translate([HorizontalSlidesLength/2-7.5,HorizontalSlidesInteraxis/2,0])
				rotate([0,90,0])
					cylinder(d=BasePlateThickness,h=15,center=true);
				
			translate([HorizontalSlidesLength/2-7.5,-HorizontalSlidesInteraxis/2,0])
				rotate([0,90,0])
					cylinder(d=BasePlateThickness,h=15,center=true);
				
			translate([HorizontalSlidesLength/2+-7.5,0,-BasePlateThickness/2+3])
				cube([15,HorizontalSlidesInteraxis,6],center=true);

		}
		
		translate([0,HorizontalSlidesInteraxis/2,0])
			rotate([0,90,0])
				cylinder(d=HorizontalSlidesDiameter+0.25,h=HorizontalSlidesLength+1,center=true);
		translate([0,-HorizontalSlidesInteraxis/2,0])
			rotate([0,90,0])
				cylinder(d=HorizontalSlidesDiameter+0.25,h=HorizontalSlidesLength+1,center=true);
		
		translate([HorizontalSlidesLength/2-7.5,0,0])
			cylinder(d=PivotingHoleDiameter,h=100,center=true);
		translate([HorizontalSlidesLength/2-7.5,0,6])
			cylinder(d=PivotingHoleDiameter*3,h=BasePlateThickness,center=true);
		
	}
	
	//Slides clamp
	module Part4()
	translate([0,0,0])
	difference()
	{
		union()
		{
			hull()
			{
				translate([BaseSideSquaringWidth/2-7.5,HorizontalSlidesInteraxis/2+HorizontalSlidesDiameter,6])
					cylinder(d=10,h=8,center=true);
				translate([BaseSideSquaringWidth/2-7.5,-HorizontalSlidesInteraxis/2-HorizontalSlidesDiameter,6])
					cylinder(d=10,h=8,center=true);
			}
		}
		
		translate([BaseSideSquaringWidth/2-7.5,HorizontalSlidesInteraxis/2+HorizontalSlidesDiameter,6])
			cylinder(d=4.25,h=100,center=true);
		translate([BaseSideSquaringWidth/2-7.5,-HorizontalSlidesInteraxis/2-HorizontalSlidesDiameter,6])
			cylinder(d=4.25,h=100,center=true);
		translate([BaseSideSquaringWidth/2-7.5,0,6])
			cylinder(d=4.25,h=100,center=true);
		
		translate([0,HorizontalSlidesInteraxis/2,0])
			rotate([0,90,0])
				cylinder(d=HorizontalSlidesDiameter+0.25,h=HorizontalSlidesLength+1,center=true);
		translate([0,-HorizontalSlidesInteraxis/2,0])
			rotate([0,90,0])
				cylinder(d=HorizontalSlidesDiameter+0.25,h=HorizontalSlidesLength+1,center=true);
		
		translate([0,HorizontalSlidesInteraxis/2,-3])
			cylinder(d=HorizontalSlidesDiameter,center=true);
		translate([0,-HorizontalSlidesInteraxis/2,-3])
			cylinder(d=HorizontalSlidesDiameter,center=true);
	}
	
//NutGrip
	module Part5()
	translate([0,0,0])
	difference()
	{
		union()
		{
			translate([0,VerticalSlidesInteraxis/2,0])
				cylinder(d=VerticalSlidesNutSize+5,h=VerticalSlidesNutHeight,center=true);
			
			translate([0,VerticalSlidesInteraxis/2,0])
			for(a=[0:45:359])
				rotate([0,0,a])
					translate([10,0,0])
						cylinder(d=5,h=VerticalSlidesNutHeight,center=true);
		}
		
		translate([0,VerticalSlidesInteraxis/2,0])
					cylinder(d=VerticalSlidesNutSize,h=VerticalSlidesNutHeight+2,center=true,$fn=6);
		
	}
	
//Side plate
	module Part6()
	translate([0,0,0])
	difference()
	{
		union()
		{
			translate([-HorizontalSlidesLength/2+7.5,HorizontalSlidesInteraxis/2,0])
				rotate([0,90,0])
					cylinder(d=BasePlateThickness,h=15,center=true);
				
			translate([-HorizontalSlidesLength/2+7.5,-HorizontalSlidesInteraxis/2,0])
				rotate([0,90,0])
					cylinder(d=BasePlateThickness,h=15,center=true);
				
			translate([-HorizontalSlidesLength/2+7.5,0,-BasePlateThickness/2+3])
				cube([15,HorizontalSlidesInteraxis,6],center=true);
			
			translate([-HorizontalSlidesLength/2+15,0,-5])
				cube([6,SidePlateLength,BasePlateThickness+10],center=true);
			translate([-HorizontalSlidesLength/2-9.5,0,-BasePlateThickness/2-3-5])
				cube([BaseSideSquaringWidth/2+20,SidePlateLength,6],center=true);
		}
		
		translate([0,HorizontalSlidesInteraxis/2,0])
			rotate([0,90,0])
				cylinder(d=HorizontalSlidesDiameter+0.25,h=HorizontalSlidesLength+1,center=true);
		translate([0,-HorizontalSlidesInteraxis/2,0])
			rotate([0,90,0])
				cylinder(d=HorizontalSlidesDiameter+0.25,h=HorizontalSlidesLength+1,center=true);
		
		translate([HorizontalSlidesLength/2-7.5,0,0])
			cylinder(d=PivotingHoleDiameter,h=100,center=true);
		translate([HorizontalSlidesLength/2-7.5,0,6])
			cylinder(d=PivotingHoleDiameter*3,h=BasePlateThickness,center=true);
		
	}
	
	//Side plate for corners
	module Part7()
	translate([0,0,0])
	difference()
	{
		union()
		{
			translate([-HorizontalSlidesLength/2+7.5,HorizontalSlidesInteraxis/2,0])
				rotate([0,90,0])
					cylinder(d=BasePlateThickness,h=15,center=true);
				
			translate([-HorizontalSlidesLength/2+7.5,-HorizontalSlidesInteraxis/2,0])
				rotate([0,90,0])
					cylinder(d=BasePlateThickness,h=15,center=true);
				
			translate([-HorizontalSlidesLength/2+7.5,0,-BasePlateThickness/2+3])
				cube([15,HorizontalSlidesInteraxis,6],center=true);
			
			translate([-HorizontalSlidesLength/2+15,0,0])
				cube([6,SidePlateLength,BasePlateThickness],center=true);
			translate([-HorizontalSlidesLength/2+7.5,0,-BasePlateThickness/2+3])
				cube([15,SidePlateLength,6],center=true);
		}
		
		translate([0,HorizontalSlidesInteraxis/2,0])
			rotate([0,90,0])
				cylinder(d=HorizontalSlidesDiameter+0.25,h=HorizontalSlidesLength+1,center=true);
		translate([0,-HorizontalSlidesInteraxis/2,0])
			rotate([0,90,0])
				cylinder(d=HorizontalSlidesDiameter+0.25,h=HorizontalSlidesLength+1,center=true);
		
		translate([HorizontalSlidesLength/2-7.5,0,0])
			cylinder(d=PivotingHoleDiameter,h=100,center=true);
		translate([HorizontalSlidesLength/2-7.5,0,6])
			cylinder(d=PivotingHoleDiameter*3,h=BasePlateThickness,center=true);
		
	}
	
	//Slides clamp
	module Part8()
	translate([0,0,0])
	difference()
	{
		union()
		{
			translate([0,0,0])
				hull()
				{
					translate([0,VerticalSlidesInteraxis/2,BasePlateThickness/2+2.5])
						cylinder(d=24,h=5,center=true);
					translate([0,VerticalSlidesInteraxis/1.5,BasePlateThickness/2+2.5])
						cylinder(d=24,h=5,center=true);
				}
				
			hull()
			{
					translate([0,VerticalSlidesInteraxis/2,BasePlateThickness/2+2.5])
						cylinder(d=24,h=5,center=true);
					translate([0,VerticalSlidesInteraxis/1.5,BasePlateThickness/2+2.5])
						cylinder(d=24,h=5,center=true);
					translate([0,VerticalSlidesInteraxis/1.1,BasePlateThickness/2+20])
						sphere(d=40);
			}
		}
		
		translate([0,VerticalSlidesInteraxis/2-9,0])
			cylinder(d=2.75,h=50,center=true);
		translate([0,VerticalSlidesInteraxis/2+9,0])
			cylinder(d=2.75,h=50,center=true);
		translate([0,VerticalSlidesInteraxis/2-9,16])
			cylinder(d=6,h=5,center=true);
		translate([0,VerticalSlidesInteraxis/2+9,16])
			cylinder(d=6,h=5,center=true);
		
			translate([0,VerticalSlidesInteraxis/2,BasePlateThickness/2+31])
				cylinder(d=26,h=50,center=true);
		
		translate([0,VerticalSlidesInteraxis/2,BasePlateThickness/2])
				cylinder(d=8.25,h=50,center=true);
	}
		
//Dremel holder
	if(Part==1)
		rotate([0,180,0])
			translate([0,0,40])
				Part1();
//Base
	if(Part==2 || Part==0)
		Part2();
	
//Circle jig
	if(Part==3)
		translate([0,0,90])
			rotate([0,90,0])
				Part3();
	
//Sliders clamps
	if(Part==4)
		translate([0,0,0])
			rotate([0,180,0])
				Part4();
	
//Nut grip
	if(Part==5)
		translate([0,0,24])
			Part5();
	
//Side guide
	if(Part==6)
		translate([0,0,-80])
			rotate([0,90,0])
				Part6();
	
//Side guide
	if(Part==7)
		translate([0,0,-80])
			rotate([0,90,0])
				Part7();

//Handle
	if(Part==8)
		translate([0,0,0])
			rotate([0,0,0])
				Part8();
	
	if(ShowAll!=0 && Part==0)
	{
		//Dremel holder
		rotate([0,180,0])
		translate([0,0,-44])
			Part1();
		//Circle jig
		if(ShowAll==1)
		if(Part==3 || Part==0)
			rotate([0,0,0])
				Part3();

		//Sliders clamps
		if(Part==4 || Part==0)
			Part4();

		translate([-BaseSideSquaringWidth+15,0,0])
			Part4();

		translate([0,0,66])
			Part5();
		translate([0,0,33])
			Part5();
		translate([0,-VerticalSlidesInteraxis,33])
			Part5();
		translate([0,-VerticalSlidesInteraxis,66])
			Part5();
		
		if(ShowAll==2)
		translate([182,0,0])
			rotate([0,0,0])
				Part6();
		
		if(ShowAll==3)
		translate([182,0,0])
			rotate([0,0,0])
				Part7();
		
		translate([0,0,0])
			rotate([0,0,0])
				Part8();
		translate([0,0,0])
			rotate([0,0,180])
				Part8();
		
		if(ShowAll==4)
		{
			rotate([0,0,67])
			translate([BaseMiddleDiameter/2-7,0,-BasePlateThickness/2-1])
			difference()
			{
				union()
				{
					translate([0,0,0])
						cylinder(d=10,h=1,center=true);
					color("Gray")
					translate([0,0,-3])
						cylinder(d=16,h=6,center=true);
					translate([0,0,-6])
						cylinder(d=10,h=1,center=true);
				}
				
				translate([0,0,-20])
					cylinder(d=3,h=50,center=true);
			}
			rotate([0,0,67+180])
			translate([BaseMiddleDiameter/2-7,0,-BasePlateThickness/2-1])
			difference()
			{
				union()
				{
					translate([0,0,0])
						cylinder(d=10,h=1,center=true);
					color("Gray")
					translate([0,0,-3])
						cylinder(d=16,h=6,center=true);
					translate([0,0,-6])
						cylinder(d=10,h=1,center=true);
				}
				
				translate([0,0,-20])
					cylinder(d=3,h=50,center=true);
			}
		}
		
		if(ShowAll!=4)
		{
			%color("lightgray")
			translate([0,HorizontalSlidesInteraxis/2,0])
				rotate([0,90,0])
					cylinder(d=HorizontalSlidesDiameter,h=HorizontalSlidesLength+1,center=true);
			%color("lightgray")
			translate([0,-HorizontalSlidesInteraxis/2,0])
				rotate([0,90,0])
					cylinder(d=HorizontalSlidesDiameter,h=HorizontalSlidesLength+1,center=true);
		}
	
	//Dremel final part
if(ShowDremel==1)
	%color("Gray")
		translate([0,0,43])
			rotate([0,0,0])
				union()
					{
						
						translate([0,0,-5.01])
							linear_extrude(twist=-360*4,height=10.02)
								translate([0.75,0,0])
									circle(d=19);
						
						translate([0,0,-10.5])
							cylinder(d=8,h=11,center=true);
						
						translate([0,0,-10])
							cylinder(d=9.5,h=4.5,center=true);
						translate([0,0,-12.7])
							cylinder(d=11.5,h=1,center=true);
						translate([0,0,-18.7])
							cylinder(d=13,h=11,center=true);
						translate([0,0,-27.2])
							cylinder(d1=8,d2=13,h=6,center=true);
						
						translate([0,0,30])
							cylinder(d1=24,d2=50,h=50,center=true);
						translate([0,0,123])
							cylinder(d=50,h=136,center=true);
						difference()
						{
							union()
							{
								translate([0,0,142])
									cylinder(d=53,h=100,center=true);
								translate([0,0,191])
									scale([1,1,0.5])
										sphere(d=53);
								translate([0,0,94])
									scale([1,1,1])
										sphere(d=53);
							}
							
							translate([70,0,0])
								cube([100,100,500],center=true);
							translate([-70,0,0])
								cube([100,100,500],center=true);
							
						}
						translate([0,0,191])
							scale([1,1,0.5])
								sphere(d=50);
						translate([0,0,200])
							cylinder(d=33,h=10,center=true);
						translate([0,0,220])
							cylinder(d1=14,d2=9,h=40,center=true);
						translate([0,0,-20])
							cylinder(d=3,h=80,center=true);
							
						translate([0,0,98])
							cylinder(d=3,h=210,center=true);
					}
}