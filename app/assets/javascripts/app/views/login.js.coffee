class App.Views.Login extends Backbone.View

  template: HandlebarsTemplates['app/templates/login']

  render: ->
    @$el.html(@template())
    @
