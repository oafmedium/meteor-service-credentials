Template.OafServiceCredentialsForm.events
  'submit .oafservicecredentialsform': (e, tpl) ->
    e.preventDefault()
    #console.log tpl
    service =
      key: tpl.find('input[name=key]').value
      credentials: {}

    tpl.findAll('input.field').forEach (item) ->
      service.credentials[item.name] = item.value

    getParentView = (startView, parentName) ->
      if startView.parentView.name is parentName
        startView.parentView
      else
        getParentView startView.parentView, parentName
    parentView = getParentView tpl.view, "Template.OafServiceCredentialsPopup"
    UI.remove parentView
    $('#OafServiceCredentialsOverlay').remove()
    Meteor.call 'oaf_service-credentials_set_credential', service

Template.OafServiceCredentialsPopup.helpers

Template.OafServiceCredentialsPopup.created = ->

Template.OafServiceCredentialsPopup.rendered = ->

Template.OafServiceCredentialsPopup.destroyed = ->
