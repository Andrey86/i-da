SimpleSchema.messages
  required: 'Требуется заполнить'
  regEx: [
    exp: SimpleSchema.RegEx.Email
    msg: "Указан невалидный почтовый адрес"
  ]
