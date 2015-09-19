# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

campus = Campus.create({
  name: 'New York Campus',
  timezone: 'Eastern Time (US & Canada)',
  locale: 'en'
})

jaden = Employee.create({
  first_name: 'Jaden',
  last_name: 'Carver',
  title: 'WDI Instructor',
  email: 'jaden.carver@gmail.com',
  campus: campus,
  debug: true,
  admin: true,
  user: User.new(password: 'tmoat')
})

wdi = Course.create({
  name: 'Web Development Immersive (WDI)'
})

