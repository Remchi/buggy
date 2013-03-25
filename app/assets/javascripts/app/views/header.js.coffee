class App.Views.Header extends Backbone.View
  className: "navbar"

  template: HandlebarsTemplates['app/templates/header']

  render: ->
    @$el.html(@template())
    @
