class Trackbone.Routers.BugsRouter extends Backbone.Router
  initialize: (options) ->
    @bugs = new Trackbone.Collections.BugsCollection()
    @bugs.reset options.bugs

  routes:
    "new"      : "newBug"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newBug: ->
    @view = new Trackbone.Views.Bugs.NewView(collection: @bugs)
    $("#bugs").html(@view.render().el)

  index: ->
    @view = new Trackbone.Views.Bugs.IndexView(bugs: @bugs)
    $("#bugs").html(@view.render().el)

  show: (id) ->
    bug = @bugs.get(id)

    @view = new Trackbone.Views.Bugs.ShowView(model: bug)
    $("#bugs").html(@view.render().el)

  edit: (id) ->
    bug = @bugs.get(id)

    @view = new Trackbone.Views.Bugs.EditView(model: bug)
    $("#bugs").html(@view.render().el)
