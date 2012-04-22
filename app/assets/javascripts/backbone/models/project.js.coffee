class Trackbone.Models.Project extends Backbone.Model
  paramRoot: 'project'

  defaults:
    name: null

  loadFeatures: ->
    @features = new Trackbone.Collections.FeaturesCollection([], {project_url: this.url()});

class Trackbone.Collections.ProjectsCollection extends Backbone.Collection
  model: Trackbone.Models.Project
  url: '/projects'
