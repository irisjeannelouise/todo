configure :development do
    DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/test_todolist.db")
   set :show_exceptions, true
end

 

configure :production do
    DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_RED_URL'])
end

