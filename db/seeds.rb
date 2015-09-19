# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nycampus = Campus.create!({
  name: 'New York Campus',
  timezone: 'Eastern Time (US & Canada)',
  locale: 'en'
})

wdi = Course.create!({
  name: 'Web Development Immersive (WDI)'
})

jaden = Employee.create!({
  first_name: 'Jaden',
  last_name: 'Carver',
  title: 'WDI Instructor',
  email: 'jaden@generalassemb.ly',
  campus: nycampus,
  debug: true,
  admin: true,
  user: User.new(password: 'tmoat')
})

pan = Employee.create!({
  first_name: 'Pan',
  last_name: 'Wangperawong',
  title: 'WDI Instructor',
  email: 'pan@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

dennis = Employee.create!({
  first_name: 'Dennis',
  last_name: 'Liaw',
  title: 'WDI Associate',
  email: 'dennis.liaw@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

bobby = Employee.create!({
  first_name: 'Bobby',
  last_name: 'King',
  title: 'WDI Associate',
  email: 'bobby.king@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

hayley = Employee.create!({
  first_name: 'Hayley',
  last_name: 'Noveck',
  title: 'Course Producer',
  email: 'hayley.noveck@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

meir = Employee.create!({
  first_name: 'Meir',
  last_name: 'Snyder',
  title: 'Teaching Assistant',
  email: 'meir.snyder@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

pluto = Cohort.create!({
  course: wdi,
  name: 'Pluto',
  campus: nycampus
})
pluto.instructors.create!(employee: jaden)
pluto.instructors.create!(employee: pan)
pluto.associates.create!(employee: dennis)
pluto.associates.create!(employee: bobby)
pluto.producers.create!(employee: hayley)
pluto.assistants.create!(employee: meir)
