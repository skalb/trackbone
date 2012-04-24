class Trackbone.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new Trackbone.Collections.ProjectsCollection()
    @projects.reset options.projects

  routes:
    ".*" : "index"

  index: ->
    view = new Trackbone.Views.Projects.IndexView(items: @projects)
    $("#list-projects").html(view.render().el)
    
    newProjectView = new Trackbone.Views.Projects.NewView(collection: @projects)
    $("#new-projects").html(newProjectView.render().el)
