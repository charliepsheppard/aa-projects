import './asteroid';
import './bullet';
import './game';
import './gameView';

const MovingObject = require("./movingObject")
import './ship';
import './utils';

// const MovingObject = require("./movingObject.js");
window.MovingObject = MovingObject;
// console.log('this is index')


document.addEventListener("DOMContentLoaded", function(){
    let canvas = document.getElementById("game-canvas");
    let ctx = canvas.getContext('2d');
    const mo = new MovingObject({
        pos: [30, 30],
        vel: [10, 10],
        radius: 5,
        color: "#00FF00"
    });
    mo.draw(ctx);
    
})


