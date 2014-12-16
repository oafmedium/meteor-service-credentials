Meteor.methods
  'oaf_service-credentials_get_empty': ->
    services = ServiceCredentials.getEmpty().fetch()
    services.forEach (item) ->
      fields = []
      for key of item.fields
        field = item.fields[key]
        field.identifier = key
        fields.push field
      item.fields = fields
    return services
  'oaf_service-credentials_set_credential': (params) ->
    check params, Object
    check params.key, String
    check params.credentials, Object
    service = ServiceCredentials.get params.key

    ServiceCredentials.set params.key, params.credentials unless service?
