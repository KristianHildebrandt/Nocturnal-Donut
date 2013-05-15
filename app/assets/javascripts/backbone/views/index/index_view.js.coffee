App.Views.Sessions ||= {}

class App.Views.Sessions.IndexView extends App.Views.AppView
  template: JST["backbone/templates/index/index"]

  initialize: () ->

  render: =>
    $(@el).html(@template())
    return this

  events:
    "tap .menu-toggle": "toggle_menu"
    "tap li": "navigate_to_item"

  navigate_to_item: (event) ->
    # TODO removeClass-Hack necessary against flickering after triggering the main menu???? works for now....
    $("#app").removeClass("expanded")
    $(event.currentTarget).addClass("highlighted")
    setTimeout ( ->
      window.router.navigate("show", true)
    ), 300
