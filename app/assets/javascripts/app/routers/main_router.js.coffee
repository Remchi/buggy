class App.Routers.MainRouter extends Backbone.Router

  routes:
    "": "index"

  initialize: ->
    @headerView = new App.Views.Header()
    @contentView = new App.Views.Content()

  index: ->
    $('#header').html(@headerView.render().el)
    $('#content').html(@contentView.render().el)
