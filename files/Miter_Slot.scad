// Miter slot dimensions
slot_length = 40;
slot_width = 19.65;
slot_height = 10.40; // total height

// T Groove dimensions for bottom of miter slot
groove_width = 23;
groove_height = 3.5;

// Nut/Screw cutout dimensions
nut_width = 12.75;
nut_height = 6;
screw_width = 6.9;

// Number of segments to create
slot_segments = 1;

module tslot(t){
    translate([(-slot_length/2)+(slot_length*(t/1.4)), 0, 0])
    intersection(){
        difference(){
            union(){
                // groove
                translate([-slot_length/2, -groove_width/2, 0])
                cube([slot_length,groove_width,groove_height], 0);
                
                // slot
                translate([-slot_length/2, -slot_width/2, groove_height])
                cube([slot_length,slot_width,slot_height], 0);
                
            }
            // screw cutout
            cylinder(h=slot_height + groove_height, d=screw_width);
            
            // nut cutout
            cylinder(h=nut_height, d=nut_width, $fn=6);
        }

        // slot
        difference(){
        }
        
        
        // Round corner edges
        scale([1,.85,1])
        cylinder(h=slot_height, d=slot_length);
    }
}

for (i =[1:slot_segments]){
    tslot(i);
}
