Loco.ListsRoute = Ember.Route.extend
  model: (params)-> @store.find('list', { board_id: params.board_id })
