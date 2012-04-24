#= require ../index_view

Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.IndexView extends Trackbone.Views.IndexView
  initialize: () ->
    super
    @options.type = "Bugs"

  getView: (bug) =>
    new Trackbone.Views.Bugs.BugView({model: bug})