class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><span class="result"></span>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @stander @
    #"click .stand-button": -> @model.get('dealerHand').hit()

  initialize: ->
    @render()
    #add listener for busted cgtest
    @model.on 'busted', => @disableHit("YOU HELLA BUSTED")
    @model.on 'dealerWins', => @dealerWins @
    @model.on 'dealerBusted', => @dealerBusted @


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  disableHit: (message)->
    #disable style setting on hit button cg test
    #alert 'hey'
    $(".hit-button").attr "disabled", "disabled"
    $(".result").text message

  stander: ->
    @disableHit("Standing...")
    @model.get('dealerHand').hit()

  dealerWins: ->
    alert('dealer wins...  boo')
    #@$el.empty()
    @model.initialize()
    @render()

  dealerBusted: ->
    alert('you win - dealer busted!')
    @render()
