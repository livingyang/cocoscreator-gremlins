// var GremlinsManager = require('gremlins-manager').GremlinsManager;

cc.Class({
    extends: cc.Component,

    properties: {
        label: {
            default: null,
            type: cc.Label
        },
        // defaults, set visually when attaching this script to the Canvas
        text: 'Hello, World!',

        switchName: 'helloworld'
    },

    // use this for initialization
    onLoad: function () {
        this.label.string = this.text;

        cc.eventManager.addListener({
            event: cc.EventListener.KEYBOARD,
            onKeyReleased: function(keyCode, event) {
                if (keyCode == cc.KEY.g) {
                    GremlinsManager.getInstance().switch();
                }
            }
        }, this.node);
    },

    // called every frame
    update: function (dt) {

    },

    onSwitchClick: function () {
        cc.director.loadScene(this.switchName);
    },

    onCocosClick: function() {
        GremlinsManager.getInstance().switch();
    }
});
