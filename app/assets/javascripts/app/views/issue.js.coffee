class App.Views.Issue extends Backbone.View

  template: HandlebarsTemplates['app/templates/issue']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
