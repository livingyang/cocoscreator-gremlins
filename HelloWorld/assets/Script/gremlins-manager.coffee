class @GremlinsManager
    @instance = null
    @getInstance: ->
        @instance = new GremlinsManager if @instance == null
        @instance
    
    isUnleash = false
    horde = null
    constructor: ->
        @horde = gremlins.createHorde()

        # clicker = gremlins.species.clicker()
        # .clickTypes(['mouseup'])
        # .positionSelector ->
        #     return [
        #         Math.random() * cc.game.canvas.getBoundingClientRect().width + cc.game.canvas.getBoundingClientRect().left
        #         Math.random() * cc.game.canvas.getBoundingClientRect().height + cc.game.canvas.getBoundingClientRect().top
        #     ]
        # @horde.gremlin(clicker)

        toucher = gremlins.species.toucher()
        .touchTypes(['tap'])
        .positionSelector ->
            pos = [
                Math.random() * cc.game.canvas.getBoundingClientRect().width + cc.game.canvas.getBoundingClientRect().left
                Math.random() * cc.game.canvas.getBoundingClientRect().height + cc.game.canvas.getBoundingClientRect().top
            ]
            pos
        @horde.gremlin(toucher)
    
    start: ->
        if not @isUnleash
            @horde.unleash()
            @isUnleash = true

    stop: ->
        if @isUnleash
            @horde.stop()
            @isUnleash = false

    switch: ->
        if @isUnleash
            @stop()
        else
            @start()