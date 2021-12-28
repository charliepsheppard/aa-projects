function GameView(game, ctx){
    this.game = game;
    this.ctx = ctx;
}

GameView.prototype.start = function(){
  
    setInterval(function(){this.game.moveObjects()}.bind(this),200)
    setInterval(function(){this.game.draw(this.ctx)}.bind(this),200)
}

module.exports = GameView;