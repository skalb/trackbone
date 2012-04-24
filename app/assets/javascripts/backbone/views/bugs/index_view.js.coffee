#= require ../index_view

Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.IndexView extends Trackbone.Views.IndexView
  initialize: () ->
    super
    @options.type = "Bugs"

  getView: (options) =>
    new Trackbone.Views.Bugs.BugView(options)