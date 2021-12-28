/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst movingObject = __webpack_require__(/*! ./movingObject */ \"./src/movingObject.js\");\n\nfunction Asteroid(object) {\n  this.pos = object.pos;\n  this.vel = Util.randomVec(4);\n  this.color = '#FFC0CB';\n  this.radius = 20;\n}\n\nUtil.inherits(Asteroid, movingObject)\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/***/ (() => {

eval("\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nfunction Game (){\n   DIM_X = 1000;\n   DIM_Y = 600;\n   NUM_ASTEROIDS = 5;\n this.asteroids = [];\n  this.addAsteroids();\n    \n}\n\nGame.prototype.addAsteroids = function() {\n    let pos;\n    let newAsteroid;\n  while(this.asteroids.length < NUM_ASTEROIDS){\n      pos = this.randomPosition();\n    newAsteroid = new Asteroid({ pos }); \n    this.asteroids.push(newAsteroid)\n  }\n}\n\nGame.prototype.randomPosition = function() {\n  return pos = [Math.floor(Math.random()*DIM_X), Math.floor(Math.random()*DIM_Y)]\n}\n\nGame.prototype.draw = function(ctx){\n    ctx.clearRect(0,0,DIM_X, DIM_Y);\n    this.asteroids.forEach(star => {\n        star.draw(ctx)\n    })\n}\n\nGame.prototype.moveObjects = function(){\n    \n\n    this.asteroids.forEach(star => {\n       \n        star.move();\n    })\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/gameView.js":
/*!*************************!*\
  !*** ./src/gameView.js ***!
  \*************************/
/***/ ((module) => {

eval("function GameView(game, ctx){\n    this.game = game;\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function(){\n  \n    setInterval(function(){this.game.moveObjects()}.bind(this),200)\n    setInterval(function(){this.game.draw(this.ctx)}.bind(this),200)\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/gameView.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Bullet = __webpack_require__(/*! ./bullet */ \"./src/bullet.js\")\nconst Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./gameView */ \"./src/gameView.js\");\nconst MovingObject = __webpack_require__(/*! ./movingObject */ \"./src/movingObject.js\")\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\")\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\n// const MovingObject = require(\"./movingObject.js\");\nwindow.MovingObject = MovingObject;\n// console.log('this is index')\n\n\ndocument.addEventListener(\"DOMContentLoaded\", function(){\n    let canvas = document.getElementById(\"game-canvas\");\n    let ctx = canvas.getContext('2d');\n\n    const newGame = new Game()\n    \n    const newGameView = new GameView(newGame,ctx)\n    newGameView.start()\n})\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/movingObject.js":
/*!*****************************!*\
  !*** ./src/movingObject.js ***!
  \*****************************/
/***/ ((module) => {

eval("function MovingObject(object) {\n  this.pos = object.pos;\n  this.vel = object.vel;\n  this.radius = object.radius;\n  this.color = object.color;\n}\n\n\n\nMovingObject.prototype.draw = function(ctx){\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function(){\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n}\n\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/movingObject.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ (() => {

eval("\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        Surrogate = function(){}\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;