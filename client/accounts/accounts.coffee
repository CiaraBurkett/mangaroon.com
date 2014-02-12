Meteor.startup ->
    Accounts.ui.config
        passwordSignupFields: 'USERNAME_AND_EMAIL'

    AccountsEntry.config
        homeRoute: '/'
        privacyUrl: '/privacy-policy'
        termsUrl: '/terms-of-use'
        dashboardRoute: '/dashboard'
        profileRoute: '/profile'
        language: 'en'
        showSignupCode: false
