Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.FeatureView extends Backbone.View
  template: JST["backbone/templates/item"]

  events:
    "click .select" : "select"
    "click .destroy" : "destroy"

  tagName: "tr"
  className: "item"

  select: () -> 
    window.toggleSelected(@el)
    @model.loadBugs()
    do (@model) ->
      @model.bugs.fetch success: ->
        bugsView = new Trackbone.Views.Bugs.IndexView(bugs: @model.bugs)
        $("#list-bugs").html(bugsView.render().el)

        # We should probably only render this once instead of each load
        newBugsView = new Trackbone.Views.Bugs.NewView(collection: @model.bugs)
        $("#new-bugs").html(newBugsView.render().el)

    @model.bugs.fetch()

  destroy:( ) ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
