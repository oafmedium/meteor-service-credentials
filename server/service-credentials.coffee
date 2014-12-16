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
