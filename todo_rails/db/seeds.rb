# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

todos = Todo.create([
  { title: 'Some Title 1', is_completed: true },
  { title: 'Some Title 2', is_completed: true },
  { title: 'Some Title 3', is_completed: false }
  ])
