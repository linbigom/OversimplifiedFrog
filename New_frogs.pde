//variabler til den initielle størrelse af frøen
float noseWidth =6 ;
float diaBody =60 ;
float diaHead =30 ;

//antalllet af frøer
int n = 50;

//arrays til henholdsvis, initiel x-position, initiel y-position, den initielle størelse af frøen, hastighed for x og y, og 2D array til farver (R, G, og B).
float [] xlist = new float[n];
float [] ylist = new float[n];
float [] sizes = new float[n];
float [] vX = new float[n];
float [] vY = new float[n];
float [] growth = new float[n];
int [][] colorlist = new int[n][3];

void setup() {
  size(500, 500);

  //vælger 6 random tal til værdierne for en frø n antal gange med en forloop
  for (int i=0; i<n; i++) {
    xlist[i] = random(0, 500);
    ylist[i] = random(0, 500);
    sizes[i] = random(1, 2);
    vX[i] = random(-2, 2);
    vY[i] = random(-2, 2);
    growth[i] = random(-0.01, 0.01);

    //da det er 2D array laves endnu et forloop, bestemmer et random tal til RGB 3 gange per n frøer
    for (int c=0; c<3; c++) {
      colorlist[i][c] = (int) random(0, 255);
    }
  }
}

void draw() {
  background(255, 192, 30);

  //loop der kører vores arrays igennem n antal gange.
  for (int i=0; i<n; i++) {
    
    //får frøen til at bevæge sig
    xlist[i]+=vX[i]; 
    ylist[i]+=vY[i];

    sizes[i]+=growth[i]; //får frøen til at blive større

    //kalder funktion der tegner frø, med argumenter der korosponderer med de oprettede arrays. 
    drawFrog(xlist[i], ylist[i], sizes[i], colorlist[i][0], colorlist[i][1], colorlist[i][2]);
  }
}

void drawFrog(float posx, float posy, float size, int R, int G, int B) {
  //frøens farve sættes til tal fra color array
  fill(R,G,B);

  //frøens krop
  circle(posx, posy-(diaBody/1.6)*size, diaHead*size);
  circle(posx, posy, diaBody*size);

  //frøens næse
  square(posx-0.5*noseWidth*size, posy-(diaBody/2+noseWidth/2)*size, noseWidth*size);

  //frøens øjne
  circle(posx-diaHead/3*size, posy-(diaBody/1.6)*size, 5*size);
  circle(posx+diaHead/3*size, posy-(diaBody/1.6)*size, 5*size);
}
