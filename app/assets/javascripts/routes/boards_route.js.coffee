Loco.BoardsRoute = Ember.Route.extend
  model: -> @store.findAll('board')
