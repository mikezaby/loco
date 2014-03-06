Loco.ListsController = Ember.ArrayController.extend
  sortProperties: ['isNew', 'priority']
  sortAscending: false
  needs: 'board'

  actions:
    new: (board) ->
      @get('model').store.createRecord('list', { onEdit: true, board: board})

    edit: (list) ->
      onEdit = list.get('onEdit')
      list.rollback() if onEdit
      list.set('onEdit', !onEdit)

    save: (list) ->
      list.save().then(
        ()      => list.set('onEdit', false),
        (error) =>
      )

    destroy: (list) ->
      list.deleteRecord()
      return if !list.get('id')

      list.save().then(
        ()=>,
        (error) => list.rollback()
      )
