Meteor.startup ->
  Meteor.subscribe 'meteor_oafservicecredentials'

  Meteor.call 'oaf_service-credentials_get_empty', (err, empty) ->
    return console.error err if err
    if empty.length > 0
      UI.renderWithData Template.OafServiceCredentialsPopup, credentials: empty, document.body
