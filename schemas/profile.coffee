@ProfileSchema = new SimpleSchema
  name:
    type: String
    label: "Имя"
  gender:
    type: String
    label: "Пол"
    optional: true
    allowedValues: ['M', 'F']
    autoform:
      firstOption: "(Укажите пол)"
      type: "select2"
      options:
        Titles.gender
  categories:
    type: [String]
    label: "Интересы"
    optional: true
    autoform:
      firstOption: false
      placeholder: "добавьте интересующие категории"
      type: "select2"
      multiple: true
      options: ->
        Categories.find().map (doc) ->
          value: doc._id
          label: doc.title
