class App.Views.Projects extends Backbone.View

  template: HandlebarsTemplates['app/templates/projects']

  render: ->
    @$el.html(@template())
    @
