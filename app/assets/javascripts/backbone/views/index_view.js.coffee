Trackbone.Views ||= {}

class Trackbone.Views.IndexView extends Backbone.View
  template: JST["backbone/templates/index"]

  initialize: () ->
    @options.items.bind('reset', @addAll)
    @options.items.bind('sync', @addAll)

  addAll: () =>
    # This shouldn't be needed, but for some reason
    # lists are rendered twice
    @$("tbody").html('')

    @options.items.each(@addOne)

  addOne: (item) =>
    item.collection = @options.items
    @$("tbody").append(@getView(item).render().el)

  render: =>
    $(@el).html(@template(type: @options.type))
    @addAll()

    return this