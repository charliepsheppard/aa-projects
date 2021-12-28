const Asteroid = require('./asteroid');
const Bullet = require('./bullet')
const Game = require('./game');
const GameView = require('./gameView');
const MovingObject = require("./movingObject")
const Ship = require('./ship')
const Util = require('./utils');

// const MovingObject = require("./movingObject.js");
window.MovingObject = MovingObject;
// console.log('this is index')


document.addEventListener("DOMContentLoaded", function(){
    let canvas = document.getElementById("game-canvas");
    let ctx = canvas.getContext('2d');

    const newGame = new Game()
    
    const newGameView = new GameView(newGame,ctx)
    // newGameView.start()
})


