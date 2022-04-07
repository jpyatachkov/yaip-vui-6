class TodoController < ApplicationController
  @@todos = [
    {id: 1, title: 'Задача 1', description: 'Описание', done: false},
    {id: 2, title: 'Задача 2', description: nil, done: true},
    {id: 3, title: 'Задача 3', description: 'Jgbcfybt', done: false},
    {id: 4, title: 'Задача 4', description: '', done: false}
  ]

  def list
    done = proc { |todo| todo[:done] }
    @done_todos = @@todos.select(&done)
    @undone_todos = @@todos.reject(&done)
  end
end
