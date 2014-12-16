#
# Public Routes
#
@PublicController = RouteController.extend
  layoutTemplate: "publicLayout"
  loadingTemplate: "loading"

Router.route "/about",
  controller: "PublicController"

Router.route "/pricing",
  controller: "PublicController"

Router.route "/sign-in",
  name: "accounts.signIn"
  template: "signIn"
  controller: "PublicController"

Router.route "/sign-up",
  name: "accounts.signUp"
  template: "signUp"
  controller: "PublicController"

#
# Dashboard Routes
#
@DashboardController = RouteController.extend
  layoutTemplate: "dashboardLayout"
  loadingTemplate: "loading"
  onBeforeAction: ->
    if Meteor.loggingIn()
      @render "loading"
    else if Meteor.user()
      @next()
    else
      @redirect "/"

Router.route "/",
  name: "home"
  action: ->
    if Meteor.user()
      @layout "dashboardLayout"
      @render "onboarding"
    else
      @layout "publicLayout"
      @render "home"
