Trackbone.Views.Projects ||= {}

class Trackbone.Views.Projects.IndexView extends Backbone.View
  template: JST["backbone/templates/projects/index"]

  initialize: () ->
    @options.projects.bind('reset', @addAll)

  addAll: () =>
    @options.projects.each(@addOne)

  addOne: (project) =>
    view = new Trackbone.Views.Projects.ProjectView({model : project})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(projects: @options.projects.toJSON() ))
    @addAll()

    return this
