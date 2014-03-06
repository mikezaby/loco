Loco.Router.map ()->
  @route('boards', path: '/')

  @resource('boards', path: '/boards')
  @resource('board', path: '/boards/:board_id', ->
    @resource('lists', path: '/lists')
  )
