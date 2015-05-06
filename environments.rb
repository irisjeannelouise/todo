configure :development do
    DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/test_todolist.db")
   set :show_exceptions, true
end

configure :production do
    db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

    DataMapper::Base.establish_connection(

        :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
        :host     => db.host,
        :username => db.user,
        :password => db.password,
        :database => db.path[1..-1],
        :encoding => 'utf8'
    )
end