class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer, @currentScore = 0) ->

  hit: ->
    if @isDealer is true then @at(0).flip()
    @add(@deck.pop()).last()
    console.log "hit calling" ,@

  stand: ->
    console.log "stand calling"
    #console.log(@at(0))




  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    #trigger "busted"  if score > 21
    if hasAce
      @bigScore [score, score + 10]
      [score, score + 10]
    else
      @bigScore [score]
      [score]


  bigScore: (score) ->
    console.log 'called big score', score, @
    #if dealer


    #if player
    if score[0] > 21 then @trigger "busted", @
    @currentScore = score[0]
    #@trigger "u"








