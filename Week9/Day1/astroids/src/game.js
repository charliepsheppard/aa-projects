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
    newAsteroid = new Asteroid({ pos }); 
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

module.exports = Game;