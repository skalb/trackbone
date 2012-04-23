Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.IndexView extends Backbone.View
  template: JST["backbone/templates/bugs/index"]

  initialize: () ->
    @options.bugs.bind('sync', @render)
    @options.bugs.bind('reset', @addAll)

  addAll: () =>
    @$("tbody").html('')
    @options.bugs.each(@addOne)

  addOne: (bug) =>
    view = new Trackbone.Views.Bugs.BugView({model : bug})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(bugs: @options.bugs.toJSON() ))
    @addAll()

    return this
