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