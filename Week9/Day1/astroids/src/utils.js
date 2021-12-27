const Util = {
    inherits(childClass, parentClass) {
        Surrogate = function(){}
        Surrogate.prototype = parentClass.prototype;
        childClass.prototype = new Surrogate();
        childClass.prototype.constructor = childClass;
    }
};

module.exports = Util;
