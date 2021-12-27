const Util = require('./utils');
const movingObject = require('./movingObject');

function Asteroid(object) {
  this.pos = object.pos;
  this.vel = Util.randomVec(4);
  this.color = '#FFC0CB';
  this.radius = 7;
}

Util.inherits(Asteroid, movingObject)

module.exports = Asteroid;
