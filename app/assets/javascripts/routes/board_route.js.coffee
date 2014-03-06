Loco.BoardRoute = Ember.Route.extend
  model: (params)-> @store.find('board', params.board_id)
