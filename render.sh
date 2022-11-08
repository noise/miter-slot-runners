echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Rendering STLs <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
mkdir -p stl
openscad files/miter_slot.scad -o stl/miter_3x100_nogroove_chain.stl \
  -D 'segments=3' -D 'segment_length=100' \
  -D 'bolt = false' -D 'groove = false' -D 'chain=true'
openscad files/miter_slot.scad -o stl/miter_3x80_nogroove.stl \
  -D 'segments=3' -D 'segment_length=100' \
  -D 'bolt = false' -D 'groove = false' -D 'chain=false'
