import java.util.List;

class PBvh
{
  BvhParser parser;  

  PBvh(String[] data) {
    parser = new BvhParser();
    parser.init();
    parser.parse( data );
  }

  void update( int ms ) {
    parser.moveMsTo( ms );//30-sec loop 
    parser.update();
  }

  //------------------------------------------------
  void draw() {
    // Previous method of drawing, provided by Rhizomatiks/Perfume

    fill(color(255));
    for ( BvhBone b : parser.getBones()) {
      pushMatrix();
      translate(b.absPos.x, b.absPos.y, b.absPos.z);
      ellipse(0, 0, 2, 2);
      popMatrix();
      if (!b.hasChildren()) {
        pushMatrix();
        translate( b.absEndPos.x, b.absEndPos.y, b.absEndPos.z);
        ellipse(0, 0, 10, 10);
        popMatrix();
      }
    }
  }

  //------------------------------------------------
  // Alternate method of drawing, added by Golan

  void drawBones(int light) {
    //noFill(); 
    stroke(255); 
    strokeWeight(1);

    List<BvhBone> theBvhBones = parser.getBones();
    int nBones = theBvhBones.size();       // How many bones are there?
    BvhBone cBone = theBvhBones.get(1);
    PVector boneCoordc = cBone.absPos; 
    float x2 = boneCoordc.x;             // Get the (x,y,z) values 
    float y2 = boneCoordc.y;             // of its start point
    float z2 = boneCoordc.z;
    /*
    BvhBone bBone = theBvhBones.get(16);
     PVector boneCoordb = bBone.absPos; 
     float x3 = boneCoordb.x;             // Get the (x,y,z) values 
     float y3 = boneCoordb.y;             // of its start point
     float z3 = boneCoordb.z;
     line(x2, y2, z2, x3, y3, z3);
     */
    BvhBone dBone = theBvhBones.get(3);  // Get the i'th bone

    PVector boneCoordx = dBone.absPos;   // Get its start point
    float xl = boneCoordx.x;             // Get the (x,y,z) values 
    float yl = boneCoordx.y;             // of its start point
    float zl = boneCoordx.z;

    if (light == 1) {
      pointLight(255, 255, 225, xl, yl, zl);
      //stroke(255, 20);
//      pushMatrix();
  //    translate( x1, y1, z1);
      //box(10);
    //  popMatrix();
    }
    for (int i=0; i<nBones; i++) {         // Loop over all the bones
      BvhBone aBone = theBvhBones.get(i);  // Get the i'th bone

      PVector boneCoord0 = aBone.absPos;   // Get its start point
      float x0 = boneCoord0.x;             // Get the (x,y,z) values 
      float y0 = boneCoord0.y;             // of its start point
      float z0 = boneCoord0.z;
      String boneName = aBone.getName(); 

      if (aBone.hasChildren()) {  
        stroke(255);

        // If this bone has children, 
        // draw a line from this bone to each of its children
        List<BvhBone> childBvhBones = aBone.getChildren(); 
        int nChildren = childBvhBones.size();
        for (int j=0; j<nChildren; j++) {
          BvhBone aChildBone = childBvhBones.get(j); 
          String childName = aChildBone.getName();

          PVector boneCoord1 = aChildBone.absPos;

          float x1 = boneCoord1.x;
          float y1 = boneCoord1.y;
          float z1 = boneCoord1.z;

          //LIGHT SOURCE

          if (childName.equals("Chest4")) {
            if (light == 1) {
              println(i);
              //pointLight(255, 255, 225, x0, y0, z0);
              //stroke(255, 20);
              pushMatrix();
              translate( x1, y1, z1);
              //box(10);
              popMatrix();
            }
          }

          //for (
          int cubeNum = 1;
          float deltaZ = (z1 - z0)/cubeNum;
          float deltaY = (y1 - y0)/cubeNum;
          float deltaX = (x1 - x0)/cubeNum;

          float maxDelta = max(deltaZ, deltaY, deltaX);


          for (int c = 0; c < cubeNum; c++) {
            pushMatrix();
            noStroke();
            //translate( x0 + deltaX*c + random(-5, 5), y0+ deltaY*c+ random(-5, 5), z0+ deltaZ*c+ random(-5, 5));
            //println(aChildBone.getName());


            //lights();
            // box(5);

            if (childName.equals("Chest")) { 
              translate(x0 + deltaX*c, y0+ deltaY*c, z0+ deltaZ*c);
              // println(x0);
              //lights();
              box(5);
            }
            popMatrix();
          }

          line(x0, y0, z0, x1, y1, z1);
        }
      } else {
        // Otherwise, if this bone has no children (it's a terminus)
        // then draw it differently. 
        stroke(255);
        PVector boneCoord1 = aBone.absEndPos;  // Get its start point
        float x1 = boneCoord1.x;
        float y1 = boneCoord1.y;
        float z1 = boneCoord1.z;

        line(x0, y0, z0, x1, y1, z1);


        boneName = aBone.getName(); 

        if (boneName.equals("Head")) { 
          if (light == 1) {
            noStroke();

            //stroke(255, 50);
            pushMatrix();
            translate( x1, y1, z1);
            sphere(10);
            popMatrix();
          } else {
            noStroke();
            shininess(1.0);
            pushMatrix();
            translate(x1, y1, z1);
            sphere(15);
            popMatrix();
          }
        }
      }
    }
  }
}