Trackbone.Views ||= {}

class Trackbone.Views.IndexView extends Backbone.View
  template: JST["backbone/templates/index"]

  initialize: () ->
    @options.items.bind('reset', @addAll)
    @options.items.bind('sync', @render)

  addAll: () =>
    @options.items.each(@addOne)

  addOne: (item) =>
    @$("tbody").append(@getView(item).render().el)

  render: =>
    $(@el).html(@template(type: @options.type))
    @addAll()

    return this