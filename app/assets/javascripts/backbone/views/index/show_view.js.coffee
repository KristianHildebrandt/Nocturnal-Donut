App.Views.Sessions ||= {}

class App.Views.Sessions.ShowView extends App.Views.AppView
  template: JST["backbone/templates/index/show"]

  initialize: () ->

  render: =>
    $(@el).html(@template())

    return this

  events:
    "tap .menu-toggle": "toggle_menu"
    "tap article button": "navigate_to_item"

  navigate_to_item: (event) ->
    $(event.currentTarget).addClass("highlighted")
    setTimeout ( ->
      window.router.navigate("index", true)
    ), 300
