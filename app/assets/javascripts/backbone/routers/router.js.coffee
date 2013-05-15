class App.Routers.Router extends Backbone.Router
  initialize: (options) ->
    @on "all", @storeRoute
    @history = []
    @transition_duration = 400
    super options

  routes:
    "index"    : "index"
    "show" : "show"
    ".*"        : "index"

  before: (route) ->
    @prev_el = this.view && this.view.$el
    if @prev_el
      @prev_el.css({"z-index": 998})
      @prev_el.anim({perspective: '300px', rotateX: '25deg'}, 0.300, 'ease')

  after: (route) ->
    @next_el = this.view.$el
    @next_el.css({"z-index": 999})

    @next_el.gfxSlideInUp
        duration: @transition_duration
        easing: "ease-out"
        () =>
          @prev_el.hide()

  index: ->
    @view = new App.Views.Sessions.IndexView()
    $("#sessions").html(@view.render().el)

  show: ->
    @view = new App.Views.Sessions.ShowView()
    $("#show-session").html(@view.render().el)

  storeRoute: ->
      @history.push Backbone.history.fragment

  previous: ->
      if @history.length > 1
          @navigate @history[@history.length-2], true 
