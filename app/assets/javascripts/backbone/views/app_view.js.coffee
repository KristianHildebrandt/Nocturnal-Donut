App.Views.AppView ||= {}

class App.Views.AppView extends Backbone.View
  toggle_menu: () ->
    $app = $("#app")
    if $app.hasClass("collapsed")
      $app.removeClass("collapsed").addClass("expanded")
    else
      $app.removeClass("expanded").addClass("collapsed")