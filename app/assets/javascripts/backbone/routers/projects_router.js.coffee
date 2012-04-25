class Trackbone.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new Trackbone.Collections.ProjectsCollection()
    @projects.reset options.projects

  routes:
    ".*"  : "showProjects"
    "projects/:project_id" : "showProjects"
    "projects/:project_id/features/:feature_id/*" : "showProjects"

  clearType: (model) ->
    $("#list-#{model}").html('')
    $("#new-#{model}").html('')

  loadChildren: (items, item_id, child_ids, callback) ->
    item = items.get(item_id)
    item.loadChildren()
    item.children.fetch(
      success: =>
        @[callback](item.children, child_ids.shift(), child_ids)
    )
    item.children.fetch()

  renderView: (selector, view) ->
    $(selector).html(view.render().el)

  renderViews: (items, item_id, type) ->
    indexView = new Trackbone.Views.IndexView(items: items, id: item_id, type: type)
    @renderView("#list-#{type.toLowerCase()}", indexView)

    newView = new Trackbone.Views.NewView(collection: items, type: type)
    @renderView("#new-#{type.toLowerCase()}", newView)

  showProjects: (project_id, feature_id, bug_id) ->
    @renderViews(@projects, project_id, "Projects")

    if project_id
      @loadChildren(@projects, project_id, [feature_id, bug_id], "loadFeatures")

  loadFeatures: (features, feature_id, child_ids) ->
    @renderViews(features, feature_id, "Features")

    if feature_id
      @loadChildren(features, feature_id, child_ids, "loadBugs")
    else
      @clearType("bugs")

  loadBugs: (bugs, bug_id, child_ids) -> 
    @renderViews(bugs, bug_id, "Bugs")