Package.describe({
  name: 'oaf:service-credentials',
  summary: 'Meteor package for saving credentials of services in database.',
  version: '1.0.0',
  git: 'https://github.com/oafmedium/meteor-service-credentials.git'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.1');
  api.use('coffeescript', ['client', 'server']);
  api.addFiles('oaf:service-credentials.coffee');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('coffeescript', ['client', 'server']);
  api.use('oaf:service-credentials');
  api.addFiles('oaf:service-credentials-tests.coffee');
});
