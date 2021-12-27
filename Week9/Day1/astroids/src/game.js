const Asteroid = require('./asteroid');

function Game() {
  const DIM_X;
  const DIM_Y;
  const NUM_ASTEROIDS;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  const newAsteroid = new Asteroid(this.randomPosition()); 
  this.asteroids.push(newAsteroid);
}

Game.prototype.randomPosition = function() {
  return pos = [Math.random(DIM_X) * 10, Math.random(DIM_Y) * 10]
}