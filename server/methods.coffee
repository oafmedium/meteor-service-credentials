Meteor.methods
  'oaf_service-credentials_get_empty': ->
    ServiceCredentials.getEmpty().fetch()
  'oaf_service-credentials_set_credential': (params) ->
    service = ServiceCredentials.get params.key
    ServiceCredentials.set params.key, params.credentials unless service.credentials?
