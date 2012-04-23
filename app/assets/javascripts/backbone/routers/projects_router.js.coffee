class Trackbone.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new Trackbone.Collections.ProjectsCollection()
    @projects.reset options.projects

  routes:
    "index"    : "index"
    ":id"      : "show"
    ".*"       : "index"

  index: ->
    @view = new Trackbone.Views.Projects.IndexView(projects: @projects)
    $("#projects").html(@view.render().el)
    
    @newProjectView = new Trackbone.Views.Projects.NewView(collection: @projects)
    $("#new-projects").html(@newProjectView.render().el)

    $("#features").html("")

    $("#bugs").html("")

  show: (id) ->
    project = @projects.get(id)

    # project.loadFeatures()
    # project.features.fetch success: ->
    #   @featuresView = new Trackbone.Views.Features.IndexView(features: project.features)
    #   $("#features").html(@featuresView.render().el)
    # project.features.fetch()