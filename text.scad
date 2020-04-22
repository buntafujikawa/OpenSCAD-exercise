// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Text

linear_extrude(height = 5)
text("日本語", font = "Hiragino Mincho ProN");

translate([-20, 0, 0])
color("red") cube(50, center=true); 

translate([-15, -15, 24.6])
color("blue") text("OpenSCAD", font = "Liberation Sans");

 text = "Align";
 font = "Liberation Sans";
 
 halign = [
   [10, "left"],
   [50, "center"],
   [90, "right"]
 ];
 
 for (a = halign) {
   translate([40, a[0], 0]) {
     color("red") cube([115, 2,0.1]);
     color("blue") cube([2, 20,0.1]);
     linear_extrude(height = 0.5) {
       text(text = str(text,"_",a[1]), font = font, size = 20, halign = a[1]);
     }
   }
 }
