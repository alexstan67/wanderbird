require 'csv'

# ############################################
# CLEANING
# ############################################
puts "Cleaning databases..."
User.destroy_all

# ############################################
# USERS
# ############################################
# Deleting current users

# Create an admin user
user = User.new
user.first_name = "Alexandre"
user.last_name = "Stanescot"
user.email = "alex@aerostan.com"
user.role = "admin"
user.password = "alex@aerostan.com"
user.confirmed_at = Time.zone.now - 1.hour
user.confirmation_sent_at = Time.zone.now - 2.hours
user.save
PilotPref.create(user: user, airport: Airport.find_by(icao: "ELLX"), is_ultralight_pilot: true)
puts "Admin user alex created"
puts "Pilot pref alex created"

# Create an user
if Rails.env.development?
  user = User.new
  user.first_name = "Rachel"
  user.last_name = "Muller"
  user.email = "rachel.fly@me.com"
  user.role = "user"
  user.password = "rachel.fly@me.com"
  user.confirmed_at = Time.zone.now - 1.hour
  user.confirmation_sent_at = Time.zone.now - 2.hours
  user.save
  PilotPref.create(user: user, airport: Airport.find_by(icao: "ELLX"), is_private_pilot: true)
  puts "User rachel created in dev"
  puts "Pilot pref rachel created"
end
