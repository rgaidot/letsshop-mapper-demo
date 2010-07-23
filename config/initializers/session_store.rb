# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_letsshop-mapper-demo_session',
  :secret      => 'e66ba1c6a15520b07cbc6c87b64c33a3c8a0c3f0c618e6b8fe1d1fca11d53384faffe2602555b05b5f2bad0135fe309ebf213f65126ee6c82be5c03050eed316'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
