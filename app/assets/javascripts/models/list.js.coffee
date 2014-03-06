Loco.List = DS.Model.extend
  name: DS.attr('string')
  archived: DS.attr('boolean', defaultValue: false)
  position: DS.attr('number')

  board: DS.belongsTo('board')

  created_at: DS.attr()
  updated_at: DS.attr()
