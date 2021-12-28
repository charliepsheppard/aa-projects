const Asteroid = require('./asteroid');

function Game (){
  DIM_X = 1000;
  DIM_Y = 600;
  NUM_ASTEROIDS = 5;
  this.asteroids = [];
  this.addAsteroids();
    
}

Game.prototype.addAsteroids = function() {
    let pos;
    let newAsteroid;
  while(this.asteroids.length < NUM_ASTEROIDS){
    pos = this.randomPosition();
    let wrapPos = this.wrap(pos)
    newAsteroid = new Asteroid(this); 
    this.asteroids.push(newAsteroid)
  }
}

Game.prototype.randomPosition = function() {
  return pos = [Math.floor(Math.random()*DIM_X), Math.floor(Math.random()*DIM_Y)]
}

Game.prototype.draw = function(ctx){
    ctx.clearRect(0,0,DIM_X, DIM_Y);
    this.asteroids.forEach(star => {
        star.draw(ctx)
    })
}

Game.prototype.moveObjects = function(){
    

    this.asteroids.forEach(star => {
       
        star.move();
    })
}

Game.prototype.wrap = function(pos) {
  if (pos[0] > DIM_X) {
    pos[0] = 0;
  } else if (pos[0] < 0) {
    pos[0] = DIM_X;
  }

  if (pos[1] > DIM_Y) {
    pos[1] = 0;
  } else if (pos[1] < 0) {
    pos[1] = DIM_Y;
  }

  return pos;
}

module.exports = Game;