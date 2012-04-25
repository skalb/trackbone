class Trackbone.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new Trackbone.Collections.ProjectsCollection()
    @projects.reset options.projects

  routes:
    ".*"  : "showProjects"
    "projects/:project_id" : "showProjects"
    "projects/:project_id/features/:feature_id/*" : "showProjects"

  showProjects: (project_id, feature_id, bug_id) ->
    view = new Trackbone.Views.IndexView(items: @projects, id: project_id, type: "Projects")
    $("#list-projects").html(view.render().el)

    newProjectView = new Trackbone.Views.NewView(collection: @projects, type: "Projects")
    $("#new-projects").html(newProjectView.render().el)

    if (project_id)
      project = @projects.get(project_id)
      project.loadChildren()
      project.children.fetch(
        success: =>
          @loadFeatures(project.children, feature_id)
      )
      project.children.fetch()

  loadFeatures: (features, feature_id) ->
    featuresView = new Trackbone.Views.IndexView(items: features, id: feature_id, type: "Features")
    $("#list-features").html(featuresView.render().el)

    # We should probably only render this once instead of each load
    newFeaturesView = new Trackbone.Views.NewView(collection: features, type: "Features")
    $("#new-features").html(newFeaturesView.render().el)

    if (feature_id)
      feature = features.get(feature_id)
      feature.loadChildren()
      feature.children.fetch(
        success: =>
          @loadBugs(feature.children, feature_id)
      )
      feature.children.fetch()
    else
      $("#list-bugs").html('')
      $("#new-bugs").html('')


  loadBugs: (bugs) -> 
    bugsView = new Trackbone.Views.IndexView(items: bugs, type: "Bugs")
    $("#list-bugs").html(bugsView.render().el)

    # We should probably only render this once instead of each load
    newBugsView = new Trackbone.Views.NewView(collection: bugs, type: "Bugs")
    $("#new-bugs").html(newBugsView.render().el)