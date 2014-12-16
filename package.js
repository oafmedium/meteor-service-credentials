Package.describe({
  name: 'oaf:service-credentials',
  summary: 'Meteor package for saving credentials of services in database.',
  version: '1.1.0',
  git: 'https://github.com/oafmedium/meteor-service-credentials.git'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.1');
  api.use('coffeescript', ['client', 'server']);
  api.use('stylus', 'client');
  api.use('mongo', ['server', 'client']);
  api.use('underscore', 'server')
  api.use('templating', 'client');
  api.use('handlebars', 'client');

  api.export('ServiceCredentials', ['server', 'client']);

  api.addFiles([
    'server/service-credentials.coffee',
    'server/methods.coffee',
    'server/publish.coffee',
  ], 'server');
  api.addFiles([
    'client/service-credentials.coffee',
    'client/startup.coffee',
    'client/views/service-credentials-popup.html',
    'client/views/service-credentials-popup.coffee',
    'client/views/service-credentials-popup.styl',
    ], 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('coffeescript', ['client', 'server']);
  api.use('mongo', 'server');
  api.use('oaf:service-credentials', 'server');
  api.addFiles('oaf:service-credentials-tests.coffee');
});
