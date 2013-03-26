class App.Views.Project extends Backbone.View

  template: HandlebarsTemplates['app/templates/project']

  events:
    "click a": "showDetails"

  showDetails: (e) ->
    e.preventDefault()
    App.Vent.trigger "project:show", @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
