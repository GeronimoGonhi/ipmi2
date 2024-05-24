//audios
import ddf.minim.*;
Minim minim;
AudioPlayer player1;
AudioPlayer player4;

//ticks(tiempo)
int ticks;
int pantalla;
boolean cronometro;
int frames;

//boton
color boton;
color textoPantalla;
color countDownColor;
String countDown;

//data/imagenes
PImage will;
float alphaValue;
boolean playAudio1;
boolean playAudio4;
int esconderFondo;

//texto
String texto1 ="Tuve que enfrentar a la muerte...\nSabía que iba a morir,\ny cada parte de mi cuerpo sintió\n un miedo indescriptible.";
String texto2 ="Pero le tengo más miedo a\nla muerte que a vivir como\nellos... incluso si cada instante\nestará lleno de agonía.";
String texto3 ="Si quiero convertirme en mi\npropia bestia inmortal... Mi\ncuerpo deberá guiar mi alma\nhacia su nuevo hogar.";
int intTexto1;
int intTexto2;
boolean notas;
//fuente
PFont miFuente;
boolean fuente;

void setup() {
  size(640, 480);
  //ticks
  ticks =0;
  pantalla = 0;
  cronometro = false;
  frames = 0;
  //boton
  boton = color(200, 0, 0);
  textoPantalla = color (225, 225, 225);
  countDown = "0";
  countDownColor = color(0);
  //data/imagenes
  alphaValue = 225;
  minim = new Minim(this);
  player1 = minim.loadFile("discurso1.mp3");
  player4 = minim.loadFile("fnaf2end.mp3");
  playAudio1 = false;
  playAudio4 = false;
  esconderFondo = 0;
  //textos
  intTexto1 = 40;
  intTexto2 = 179;
  notas = true;
  //fuente
  miFuente = createFont("Freestyle Script", 30);
}

void draw() {
  //() {}
  background(0);
  will = loadImage("will"+pantalla+".jpg");
  image(will, 0, 0, width, height);
  fill(0, esconderFondo);
  rect(0, 0, width, height);
  if (playAudio1 && !player1.isPlaying()) {
    player1.play();
  } else if (!playAudio1 && player1.isPlaying()) {
    player1.pause();
    player1.rewind();
  }
  if (playAudio4 && !player4.isPlaying()) {
    player4.play();
  } else if (!playAudio4 && player4.isPlaying()) {
    player4.pause();
    player4.rewind();
  }
  if (fuente == true) {
    textFont(miFuente);
  } else {
    textFont (createFont("Arial", 20));
  }

  println("mouseX");
  println(mouseX);
  println("mouseY");
  println(mouseY);

  if (cronometro == true) {
    frames ++;
  }
  if (frames == 37) {
    frames = 0;
    ticks +=1;
  }
  if (ticks == 5) {
    pantalla += 1;
    ticks = 0;
  } /////////////PANTALLAS (sin switch case)
  if (pantalla == 0) {
    if (ticks == 0) {
      countDown = "iniciando en:3";
    }
    if (ticks == 1) {
      countDown = "iniciando en:2";
    }
    if (ticks == 2) {
      countDown = "iniciando en:1";
    }
    if (ticks == 3) {
      countDown = "iniciando en:0";
    }
    if (ticks == 4) {
      countDown = "iniciando...";
      esconderFondo =300;
    }
    noStroke();
    fill(boton);
    rect(width/2-80, height/2-30, 150, 50);
    fill(textoPantalla);
    textAlign(CENTER);
    text("Iniciar", width/2, height/2);
    fill(countDownColor);
    textSize(18);
    textAlign(CENTER);
    text(countDown, width/2, height/2+40);

    if (notas == true) {
      textAlign(LEFT);
      fill(225, 0, 0);
      text("<--sistema de tiempo", 132, 30);
      text("NOTA:Me deje llevar por la ambientación del \nlibro y sin querer el tp me quedó demasiado \ncrepy, espero que lo disfruten <3\n\nlos dibujos fueron hechos por mi B)\nla voz es de un audiolibro...\n\npuede que haya hecho el tp demasiado extenso\nsin necesidad, pero me divertí mucho haciendolo", 20, 289);
    }
  }
  if (pantalla == 1) {
    esconderFondo =0;
    fill(225, 0, 50);
    textAlign(LEFT);
    text(texto1, 370, intTexto1);
    intTexto1 ++;
    playAudio1 = true;
    fuente = true;
  }
  if (pantalla == 2) {
    fill(100, 0, 225);
    textAlign(LEFT);
    text(texto2, 370, intTexto2);
    intTexto2 --;
  }
  if (pantalla == 3) {
    fill(random(0, 225), 0, random(0, 225));
    textAlign(LEFT);
    text(texto3, 370, 100);
  }
  if (pantalla == 4) {
    playAudio1 = false;
    fuente = false;
    fill(0, 0, 0, alphaValue);
    rect(0, 0, width, height);
    alphaValue -= 0.1;
    if (alphaValue < 0) {
      alphaValue = 0;
    }
    noStroke();
    fill(boton);
    rect(width/2-80, height/2-30, 160, 50);
    fill(textoPantalla);
    textSize(20);
    textAlign(CENTER);
    text("Volver al inicio", width/2, height/2);
    cronometro = false;
    playAudio4 = true;
    push();
    textSize(15);
    fill(200, 0, 0, 220);
    textAlign(LEFT);
    text("Goñi Gerónimo 94758/7\nbasado en la novela:''Five Nights at Freddy's: The fourth closet''", 28, 449);
    pop();
  }
  if (pantalla > 4) {
    pantalla = 0;
  }
  push();
  textAlign(LEFT);
  textSize(25);
  fill(225, 225, 225, 100);
  text("frame:"+frames, 10, 20);
  text("tick:"+ticks, 10, 40);
  text("pantalla:"+pantalla, 10, 60);
  pop();
}

void mousePressed() {
  if (mouseX > 240 && mouseX < 390 && mouseY > 209 && mouseY < 260) {
    if (pantalla == 0 || pantalla == 4) {
      boton = color(225, 225, 225);
      textoPantalla =color(0);
    }
  }
}
void mouseReleased() {
  if (mouseX > 240 && mouseX < 390 && mouseY > 209 && mouseY < 260) {
    if (pantalla == 0) {
      boton = color(200, 0, 0);
      textoPantalla = color (225, 225, 225);
      cronometro = true;
      countDownColor =color (225, 225, 225);
      notas = false;
    }
    if (pantalla == 4) {
      frames = 0;
      boton = color(200, 0, 0);
      ticks = 0;
      pantalla = 0;
      countDownColor =color (0);
      playAudio4 = false;
      intTexto1 = 40;
      intTexto2 = 179;
      fuente = false;
      notas =true;
    }
  }
}
void keyReleased() {
  if (key ==' ') {
    frames = 0;
    ticks = 0;
    pantalla +=1;
    if (pantalla == 5) {
      frames = 0;
      boton = color(200, 0, 0);
      ticks = 0;
      pantalla = 0;
      countDownColor =color (0);
      playAudio1 = false;
      playAudio4 = false;
      intTexto1 = 40;
      intTexto2 = 179;
      fuente = false;
      notas =true;
    }
  }
}
