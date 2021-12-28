const Util = require('./utils');
const movingObject = require('./movingObject');

function Asteroid(object) {
  this.pos = object.randomPosition();
  this.vel = Util.randomVec(4);
  this.color = '#FFC0CB';
  this.radius = 20;
}

Util.inherits(Asteroid, movingObject)

module.exports = Asteroid;
