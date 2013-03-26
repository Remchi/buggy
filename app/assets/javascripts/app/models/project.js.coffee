class App.Models.Project extends Backbone.Model
  url: "/projects"

class App.Collections.Projects extends Backbone.Collection
  model: App.Models.Project
  url: "/projects"
