float posx =50 ;
float posy =70 ;
float nosewidth =10 ;
float diabig =100 ;
float diasmall =50 ;

float size;

float time = 0;
float speed = 2;



void setup(){

size(500,500);

}

void draw(){
  maths();
  
  tegn();
  
//bastard

if (size>2000)
  time=0;

 
}

void tegn(){
 
   background(255,192,203);


fill(255,192,203);
//body
circle(posx,posy-60*size,diasmall*size);
circle(posx,posy,diabig*size);

//nose
square(posx-0.5*nosewidth*size,posy-(diabig/2+nosewidth/2)*size,nosewidth*size);

//eyes
circle(posx-diasmall/3*size,posy-60*size,5*size);
circle(posx+diasmall/3*size,posy-60*size,5*size);
  
  
  
}


void maths(){

  time++;
//swim
posx=time*speed;  
posy=time*speed;  

posy=posy+sin(time/5)*100; 

//bigger

size=pow(1.02,posx/1)/100+0.3;



}
