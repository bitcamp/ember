# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
Ember::Application.config.secret_token = 'd67e101829bda104d94369f0c4744fe56e930d188642ee9a988790d763b0111dfd95d96d58e9e92624ea2ed97abf27ec4ebfdb68087407d8ccdf4184fd209340'
Ember::Application.config.secret_key_base = 'jeff'