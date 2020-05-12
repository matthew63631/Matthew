Table table;
Table table2;
PImage worldmap;
Float Flag;
int value = 0;

void setup() {

  size(1024, 512);
  String url = ("https://api.mapbox.com/styles/v1/mapbox/light-v10/static/0,0,1,0/1024x512?access_token=pk.eyJ1IjoibWF0dGhldzYzNjMxIiwiYSI6ImNrYTJoNWJqMDBhYnIzbnBuamVsYW16bjQifQ.st_BaTviPgZ4VomHGGzP3w");
  worldmap = loadImage(url, "png");
  table = loadTable("https://raw.githubusercontent.com/matthew63631/Matthew/master/EE.csv.csv", "header");
  table2 = loadTable("data/tsunami.csv", "header");
}

boolean flag=true;

void draw ()
{
  image(worldmap, 0, 0);
  smooth();
  for (TableRow row : table.rows ()) {

    String time = row.getString("time");
    float mag = row.getFloat("mag");
    float latitude = row.getFloat("latitude");
    float longitude = row.getFloat("longitude");
    //println(longitude);

    float mapX = map(longitude, -180, 180, 0, width);
    float mapY = map(latitude, 90, -90, 0, height);

    float mapMag = map(mag, 0, 10, 5.0, 10);

    stroke(255, 0, 0);
    //strokeWeight(5);
    //point(mapX, mapY);
    //strokeWeight(1);
    //noFill();


    if (flag==true) {
      fill(0, 0, 255);
      flag=false;
    } else {
      fill(255,200,20);
      flag=true;
    }
    ellipse(mapX, mapY, 5, 5);
  }


  for (TableRow row : table2.rows ()) {

    String year = row.getString("year");
    float runup = row.getFloat("runup");
    float latitude = row.getFloat("latitude");
    float longitude = row.getFloat("longitude");
    //println(runup);

    float mapX = map(longitude, -180, 180, 0, width);
    float mapY = map(latitude, 90, -90, 0, height);

    float maprunup = map(runup, 0, 10, 0, 1000);

    stroke(0);
    //strokeWeight(5);
    //point(mapX, mapY);
    //strokeWeight(1);
    //noFill();
    
    if (flag==true) {
      fill(0, 0, 255);
      flag=false;
    } else {
      fill(0, 255, 255);
      flag=true;
    }
    ellipse(mapX, mapY, 5, 5);
  }
}













