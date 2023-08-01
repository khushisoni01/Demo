# config/initializers/stripe.rb
Rails.configuration.stripe = {
  publishable_key: '

pk_test_51NaHNCSDhGw9TGc8TIGhENSVKFiXOjwiD8x7seIkPI11KAk8W5McPbDgZWQ6q75M23YAZpDFWehw82GUNYQ6g19800gmnBfe2r',
  secret_key: '

sk_test_51NaHNCSDhGw9TGc8LOE4SxmWJQC9RsK11P2mLfmeivPtYTie5g0qTYy3JdUTyJnt1HZGxybKIPy1tNSOrcwqpR2v002y9C9jf3'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
