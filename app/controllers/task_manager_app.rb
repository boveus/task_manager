#bookmark
#https://github.com/turingschool-examples/task_manager_redux#linking-our-app-to-our-database


require_relative '../models/task.rb'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  # get '/tasks' do
  # @tasks = ["task1", "task2", "task3"]
  # erb :index
  # end

  get '/tasks' do
    @tasks = Task.all
    erb :index
  end

  post '/tasks' do
    task = Task.new(params[:task])
    task.save
    redirect '/tasks'
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
  "<p>Params: #{params}</p> <p>Task params: #{params[:task]}</p>"
  end

  get '/tasks/:id' do
    @task = Task.find(params[:id])
    erb :show
  end
end
