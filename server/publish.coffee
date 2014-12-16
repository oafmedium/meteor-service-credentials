Meteor.publish 'meteor_oafservicecredentials', ->
  ServiceCredentials.public this
