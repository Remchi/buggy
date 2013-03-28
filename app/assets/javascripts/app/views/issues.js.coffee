class App.Views.Issues extends Backbone.View

  template: HandlebarsTemplates['app/templates/issues']

  initialize: ->
    @childViews = []

  render: ->
    @$el.html(@template({ count: @collection.length }))
    @collection.forEach @renderIssue, @
    @

  renderIssue: (model) ->
    v = new App.Views.Issue({ model: model })
    @childViews.push(v)
    @$('#issues_list').append(v.render().el)
