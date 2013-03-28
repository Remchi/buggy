class App.Models.Issue extends Backbone.Model
  urlRoot: "/issues"

class App.Collections.Issues extends Backbone.Collection
  model: App.Models.Issue
  url: "/issues"
