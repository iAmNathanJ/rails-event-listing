# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

if ENV["HEROKU_APP_NAME"]
  events = Event.create([
    { city: 'Awesome Event #1' },
    { city: 'Rad Event #2' },
    { city: 'Meh Event #1' }
  ])
end
