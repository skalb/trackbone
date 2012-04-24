#= require ../item_view

Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.BugView extends Trackbone.Views.ItemView
  initialize: () ->
    super

    # For some reason, the model no longer has a reference to
    # it's collection when we select() it
    # As a hack, I'm keeping a reference to the collection
    @collection = @options.model.collection