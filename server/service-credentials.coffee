ServiceCredentials = {}

ServiceCredentials._collection = new Mongo.Collection 'meteor_servicecredentials',
  _preventAutopublish: true
ServiceCredentials._used = []

ServiceCredentials.init = (service) ->
  @_used.push service.identifier if @_used.indexOf(service.identifier) is -1
  unless @exists(service.identifier)
    @_collection.insert service

ServiceCredentials.get = (identifier) ->
  service = @_collection.findOne identifier: identifier
  service.credentials if service?

ServiceCredentials.public = (self) ->
  services = @_collection.find
    identifier:
      $in: @_used

  getClientService = (service) ->
    tmpService = _.clone service
    delete tmpService.fields
    delete tmpService._id
    delete tmpService.description
    tmpService.credentials = {}
    for key of service.credentials
      credential = service.credentials[key]
      field = service.fields[key]
      tmpService.credentials[key] = credential if field.public

    tmpService

  handle = services.observe
    added: (service) ->
      self.added 'meteor_servicecredentials', service._id, getClientService(service)
      console.log service
    changed: (service, old) ->
      self.changed 'meteor_servicecredentials', old._id, getClientService(service)
    removed: (service) ->
      self.removed 'meteor_servicecredentials', service._id
  self.ready()
  self.onStop ->
    handle.stop()

ServiceCredentials.exists = (identifier) ->
  @_collection.find(identifier: identifier).count() > 0

ServiceCredentials.getEmpty = ->
  @_collection.find
    $and: [
      credentials:
        $exists: false
    ,
      identifier:
        $in: @_used
    ]

ServiceCredentials.set = (identifier, credentials) ->
  if @exists(key)?
    @_collection.update (identifier: identifier),
      $set:
        credentials: credentials


ServiceCredentials.remove = (identifier) ->
  @_collection.remove identifier:identifier
