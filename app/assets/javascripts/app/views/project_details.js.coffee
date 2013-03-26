class App.Views.ProjectDetails extends Backbone.View

  template: HandlebarsTemplates['app/templates/project_details']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
