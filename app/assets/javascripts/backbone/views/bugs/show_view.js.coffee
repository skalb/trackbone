Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.ShowView extends Backbone.View
  template: JST["backbone/templates/bugs/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
