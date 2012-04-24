#= require ../item_view

Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.FeatureView extends Trackbone.Views.ItemView
  initialize: () ->
    super

    # For some reason, the model no longer has a reference to
    # it's collection when we select() it
    # As a hack, I'm keeping a reference to the collection
    @collection = @options.model.collection

  renderChildren: (children) ->
    bugsView = new Trackbone.Views.Bugs.IndexView(items: children)
    $("#list-bugs").html(bugsView.render().el)

    # We should probably only render this once instead of each load
    newBugsView = new Trackbone.Views.NewView(collection: children, type: "Bugs")
    $("#new-bugs").html(newBugsView.render().el)