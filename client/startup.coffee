Meteor.startup ->
  Meteor.call 'oaf_service-credentials_get_empty', (err, empty) ->
    return console.error err if err
    if empty.length > 0
      console.log empty
      UI.renderWithData Template.OafServiceCredentialsPopup, credentials: empty, document.body
