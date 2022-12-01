require "sinatra/base"

class Application < Sinatra::Base
  get "/names" do
    names = params[:names]
    return "#{names}"
  end

  get "/" do
    return "Hello!"
  end

  get "/hello" do
    name = params[:name]

    return "Hello #{name}"
  end

  get "/posts" do
    name = params[:name]
    cohort_name = params[:cohort_name]

    return "Hello, #{name}, you are in the cohort #{cohort_name}"
  end

  # Exercise one :
  get "/hello" do
    name = params[:name]

    return "Hello #{name}"
  end

  post "/posts" do
    title = params[:title]
    return "Post was created with title #{title}"
  end

  # Challenge:
  post "/submit" do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: #{message}"
  end

  post "/sort-names" do
    names = params[:names]
    return names.split(",").sort.join(",")
  end
end
