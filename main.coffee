#!vanilla
            
$blab.stopAnimation = ->
    clearTimeout $blab.animateId if $blab.animateId
    $blab.animateId = null

$blab.animate = (snapshotFunction, numSnapshots, delay=10) ->
    $blab.stopAnimation()
    n = 1
    snapshot = ->
        snapshotFunction()
        n++
        $blab.stopAnimation() if n>numSnapshots
    $blab.animateId = setInterval (-> snapshot()), delay

