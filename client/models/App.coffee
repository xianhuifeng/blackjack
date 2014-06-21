#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'playerScore', 0
    @set 'dealerScore', 0
    #@get ('playerHand').on 'change:currentScore', => @setPlayer @

  #setPlayer: (hand) ->
    #console.log 'we get to set player', hand
