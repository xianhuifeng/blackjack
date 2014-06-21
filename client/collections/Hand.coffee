class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    #if @isDealer is true then @at(0).flip()
    @add(@deck.pop()).last()

  stand: ->
    console.log "stand calling"



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
    if hasAce
      [score, score + 10]
    else
      [score]

  bestScore: ->
    scoreArr = do @scores
    if scoreArr.length is 1
      scoreArr[0]
    else
      if scoreArr[1] > 21
        scoreArr[0]
      else scoreArr[1]









