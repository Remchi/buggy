#= require_self
#= require_tree ./routers

window.App =
  Routers: {}
  initialize: ->
    new App.Routers.MainRouter()
    Backbone.history.start()
