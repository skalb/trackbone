class Trackbone.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new Trackbone.Collections.ProjectsCollection()
    @projects.reset options.projects

  routes:
    "new"      : "newProject"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newProject: ->
    @view = new Trackbone.Views.Projects.NewView(collection: @projects)
    $("#new-project").html(@view.render().el)

  index: ->
    @view = new Trackbone.Views.Projects.IndexView(projects: @projects)
    $("#projects").html(@view.render().el)
    $("#new-project").html(@view.render().el)
    $("#features").html("")
    $("#new-feature").html("")
    $("#bugs").html("")
    $("#new-bug").html("")

  show: (id) ->
    project = @projects.get(id)
    @projectView = new Trackbone.Views.Projects.ShowView(model: project)
    $("#projects").html(@projectView.render().el)

    project.loadFeatures()
    project.features.fetch success: ->
      @featuresView = new Trackbone.Views.Features.IndexView(features: project.features)
      $("#features").html(@featuresView.render().el)
    project.features.fetch()

  edit: (id) ->
    project = @projects.get(id)

    @view = new Trackbone.Views.Projects.EditView(model: project)
    $("#projects").html(@view.render().el)
