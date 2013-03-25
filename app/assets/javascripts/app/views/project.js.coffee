class App.Views.Project extends Backbone.View

  template: HandlebarsTemplates['app/templates/project']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
