# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Folio_session',
  :secret      => 'a65496f4485978b4a5d5934b697b10a642297fe337ece6d1ac84f1e710b9002c9019d3d280b9b14ec78557693f66982ff59430e622f82cf70709542ac0876955'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
