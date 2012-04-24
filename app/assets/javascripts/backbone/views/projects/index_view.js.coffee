#= require ../index_view

Trackbone.Views.Projects ||= {}

class Trackbone.Views.Projects.IndexView extends Trackbone.Views.IndexView
  initialize: () ->
    super
    @options.type = "Projects"

  getView: (options) =>
    new Trackbone.Views.Projects.ProjectView(options)
