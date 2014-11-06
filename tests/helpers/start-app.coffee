`import Ember from 'ember'`
`import Application from '../../app'`
`import Router from '../../router'`
`import config from '../../config/environment'`

startApp = (attrs) ->\
  App = null
  attributes = Ember.merge({}, config.APP)
  attributes = Ember.merge(attributes, attrs); # use defaults, but you can override
  Router.reopen
    location: 'none'
  Ember.run ->
    App = Application.create(attributes)
    App.setupForTesting()
    App.injectTestHelpers()
  App.reset(); # this shouldn't be needed, i want to be able to "start an app at a specific URL"
  App

`export default startApp`
