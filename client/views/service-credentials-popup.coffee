Template.OafServiceCredentialsPopup.events
  'submit .oafservicecredentialsform': (e, tpl) ->
    e.preventDefault()
    service =
      key: tpl.find('input[name=key]').value
      credentials: {}

    tpl.find('input.field').forEach (item) ->
      service.credentials[item.name] = item.value

    Meteor.call 'oaf_service-credentials_set_credential', service

Template.OafServiceCredentialsPopup.helpers

Template.OafServiceCredentialsPopup.created = ->

Template.OafServiceCredentialsPopup.rendered = ->

Template.OafServiceCredentialsPopup.destroyed = ->
