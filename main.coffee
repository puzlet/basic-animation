#!vanilla

class $blab.BasicAnimation
    
    contructor: (@spec)->

        @n = 1
        @animateId = null
        @snapshotFunction = @spec.snapshotFunction
        @numSnapshots = @spec.numSnapshots
        @strobeFunction = @spec.strobeFunction
        @strobeInterval = @spec.strobeInterval
        @delay = @spec.delay
        
        
    stopAnimation: ->
        clearTimeout @animateId if @animateId
        @animateId = null

    animate: ->
        @stopAnimation()
        console.log "n>>>", @n
        snapshot = =>
            @snapshotFunction()
            @n++
            @stopAnimation() if @n>@numSnapshots
            @strobeFunction() if @n%@strobeInterval==0

        @animateId = setInterval (-> snapshot()), @delay
        
