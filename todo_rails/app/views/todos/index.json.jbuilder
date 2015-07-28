json.todos @todos do |todo|
  json.id todo.id
  json.title todo.title
  json.is_completed todo.is_completed
end
