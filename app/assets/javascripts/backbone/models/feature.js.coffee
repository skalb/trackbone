class Trackbone.Models.Feature extends Backbone.Model
  paramRoot: 'feature'

  defaults:
    name: null

  loadBugs: ->
    @bugs = new Trackbone.Collections.BugsCollection([], {feature_url: this.url()});

class Trackbone.Collections.FeaturesCollection extends Backbone.Collection
  model: Trackbone.Models.Feature
  initialize: (model, args) ->
    @url = ->
      args.project_url + "/features"
