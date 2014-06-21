class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><span class="result"></span>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .stand-button": -> @model.get('dealerHand').hit()

  initialize: ->
    @render()
    #add listener for busted cgtest
    @model.get('playerHand').on 'busted', => @disableHit @


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  disableHit: ->
    #disable style setting on hit button cg test
    #alert 'hey'
    $(".hit-button").attr "disabled", "disabled"
    $(".result").text "YOU HELLA BUSTED!!"
