#= require ../index_view

Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.IndexView extends Trackbone.Views.IndexView
  initialize: () ->
    @options.type = "Bugs"

  getView: (bug) =>
    new Trackbone.Views.Bugs.BugViews({model: bug})