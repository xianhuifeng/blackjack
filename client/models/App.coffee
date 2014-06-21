#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    #@set 'playerScore', 0
    #@set 'dealerScore', 0
    @get('playerHand').on 'add', => @playerStatus(@get('playerHand'))
    @get('dealerHand').on 'add', => @dealerStatus(@get('dealerHand'))

  playerStatus: (hand)->
    #call hand.bestcore
    console.log "hand.bestScore : " , do hand.bestScore
    bestScore = do hand.bestScore
    if bestScore > 21 then @trigger "busted", @

  dealerStatus: (hand)->
    #if 3 cards, flip the first
    if hand.length is 3
        hand.at(0).flip()

    #if dealer best score > player best score and < 22
    playerScore = do @get('playerHand').bestScore
    dealerScore = do hand.bestScore
    console.log 'player best score is ', playerScore
    console.log 'dealer best score is ', dealerScore
    if dealerScore > playerScore and dealerScore < 22
        alert 'dealer winning in app model'
        @trigger "dealerWins", @
    else if dealerScore > 21
        @trigger "dealerBusted", @
    else
        do hand.hit

    #bestScore = do hand.bestScore
    #if bestScore > 21 then @trigger "busted", @
