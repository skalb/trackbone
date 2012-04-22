class Trackbone.Models.Bug extends Backbone.Model
  paramRoot: 'bug'

  defaults:
    name: null

class Trackbone.Collections.BugsCollection extends Backbone.Collection
  model: Trackbone.Models.Bug
  url: '/bugs'
