Trackbone.Views.Projects ||= {}

class Trackbone.Views.Projects.IndexView extends Backbone.View
  template: JST["backbone/templates/index"]

  initialize: () ->
    @options.projects.bind('reset', @addAll)
    @options.projects.bind('sync', @render)

  addAll: () =>
    @options.projects.each(@addOne)

  addOne: (project) =>
    view = new Trackbone.Views.Projects.ProjectView({model : project})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(type: "Projects"))
    @addAll()

    return this