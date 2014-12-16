#console.log ServiceCredentials
@ServiceCredentials = {}# unless ServiceCredentials?

@ServiceCredentials._collection = new Mongo.Collection 'meteor_servicecredentials',
  _preventAutopublish: true

@ServiceCredentials.init = (key, fields) ->
  @_collection.insert
    key: key
    fields: fields

@ServiceCredentials.get = (key) ->
  service = @_collection.findOne key: key
  service.credentials if service?

@ServiceCredentials.getEmpty = ->
  @_collection.find
    $or:
      credentials:
        $exists: false

@ServiceCredentials.set = (key, credentials) ->
  if @get(key)?
    @_collection.update (key: key),
      credentials: credentials
  else
    @_collection.insert
      key: key
      credentials: credentials


@ServiceCredentials.remove = (key) ->
  @_collection.remove key:key
