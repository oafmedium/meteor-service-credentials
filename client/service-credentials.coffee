ServiceCredentials = {}

ServiceCredentials._collection = new Mongo.Collection 'meteor_servicecredentials'

ServiceCredentials.get = (identifier) ->
  service = @_collection.findOne identifier: identifier
  service.credentials if service?
