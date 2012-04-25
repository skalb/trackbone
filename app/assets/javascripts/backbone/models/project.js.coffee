class Trackbone.Models.Project extends Backbone.Model
  paramRoot: 'project'

  defaults:
    name: null

  loadChildren: ->
    @children = new Trackbone.Collections.FeaturesCollection([], {project_url: @url()});

class Trackbone.Collections.ProjectsCollection extends Backbone.Collection
  model: Trackbone.Models.Project
  initialize: (model, args) ->
    @url = ->
      "/projects"

