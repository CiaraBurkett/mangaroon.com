Meteor.startup ->
    Accounts.ui.config
        passwordSignupFields: 'EMAIL_ONLY'

    AccountsEntry.config
        homeRoute: '/'
        privacyUrl: '/privacy-policy'
        termsUrl: '/terms-of-use'
        dashboardRoute: '/dashboard'
        profileRoute: '/profile'
        language: 'en'
        showSignupCode: false
