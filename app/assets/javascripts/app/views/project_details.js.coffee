class App.Views.ProjectDetails extends Backbone.View

  template: HandlebarsTemplates['app/templates/project_details']

  events:
    "click button.destroy": "deleteProject"
    "click button.edit": "editProject"

  editProject: -> App.Vent.trigger "project:edit", @model

  deleteProject: ->
    return unless confirm("Are you sure?")
    @model.destroy
      success: -> App.Vent.trigger "project:destroy"

  initialize: ->
    @childViews = []
    @listenTo @model, "sync", @renderDetails
    @model.fetch()

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  renderDetails: ->
    @$el.html(@template(@model.toJSON()))
    v = new App.Views.Issues({ collection: @model.issues })
    @childViews.push(v)
    @$('#issues').html(v.render().el)
