Rails.configuration.stripe = {

  :publishable_key => "pk_live_RDoJb2xGXt2JfudWHBgh1JQP",

  :secret_key => "sk_live_9xcRwU7lRHeyxutoJGU2H3qt"

}

Stripe.api_key = Rails.configuration.stripe[:secret_key]