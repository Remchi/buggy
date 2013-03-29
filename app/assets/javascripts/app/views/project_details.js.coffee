class App.Views.ProjectDetails extends Backbone.View

  template: HandlebarsTemplates['app/templates/project_details']

  events:
    "click button.destroy": "deleteProject"
    "click button.edit": "editProject"

  editProject: -> App.Vent.trigger "project:edit", @model

  deleteProject: ->
    return unless confirm("Are you sure?")
    @model.destroy { wait: true }

  initialize: ->
    if @model.get('user_id') is App.currentUser.id
      @model.set owned: true

    @childViews = []
    @listenTo @model, "change", @renderDetails
    @listenTo @model, "error", @triggerAccessDenied
    @listenTo @model, "destroy", @triggerProjectDestroy
    @model.fetch()

  triggerProjectDestroy: -> App.Vent.trigger "project:destroy"
  triggerAccessDenied: -> App.Vent.trigger "access_denied"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  renderDetails: ->
    @$el.html(@template(@model.toJSON()))
    v = new App.Views.Issues({ collection: @model.issues })
    @childViews.push(v)
    @$('#issues').html(v.render().el)

    v1 = new App.Views.NewIssue({ model: new App.Models.Issue({ project_id: @model.id }) })
    @childViews.push(v1)
    @$('#new_issue').html(v1.render().el)
