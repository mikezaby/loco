Loco.BoardsController = Ember.ArrayController.extend
  sortProperties: ['isNew', 'created_at']
  sortAscending: false

  actions:
    new: -> @get('model').store.createRecord('board', { onEdit: true })

    edit: (board) ->
      onEdit = board.get('onEdit')
      board.rollback() if onEdit
      board.set('onEdit', !onEdit)

    save: (board) ->
      board.save().then(
        ()      => board.set('onEdit', false),
        (error) =>
      )

    destroy: (board) ->
      board.deleteRecord()
      return if !board.get('id')

      board.save().then(
        ()=>,
        (error) => board.rollback()
      )
