#= require_self
#= require_tree ./mixins
#= require_tree ./models
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./routers
#
I18n.defaultLocale = "en"
I18n.locale = "en"

Handlebars.registerHelper "t", (msg) -> I18n.t msg

window.App =
  Routers: {}
  Views: {}
  Collections: {}
  Models: {}
  Mixins: {}
  Vent: _.clone(Backbone.Events)
  initialize: (data) ->
    App.currentUser = new App.Models.CurrentUser(data.current_user)
    new App.Routers.MainRouter()
    Backbone.history.start()
