#= require ../index_view

Trackbone.Views.Projects ||= {}

class Trackbone.Views.Projects.IndexView extends Trackbone.Views.IndexView
  initialize: () ->
    super
    @options.type = "Projects"

  getView: (project) =>
    new Trackbone.Views.Projects.ProjectView({model: project})
