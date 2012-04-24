Trackbone.Views.Projects ||= {}

class Trackbone.Views.Projects.IndexView extends Trackbone.Views.IndexView
  initialize: () ->
    @options.type = "Projects"

  getView: (project) =>
    new Trackbone.Views.Projects.ProjectView({model: project})
