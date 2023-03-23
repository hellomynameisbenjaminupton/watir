require 'watir'
require 'cucumber'
require 'securerandom'
require 'active_record'

module Database

  def db_connect
    @connection = ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    database: 'watir',
    host: '119.18.19.246',
    port: '3306',
    username: ENV['MY_DB_USER'],
    password: ENV['MY_DB_PASSWORD'],
    ssl_mode: 'disabled'
    )
  end


  def example_db
    sql = "SELECT * FROM test WHERE test_id = 1;"
    @result = @connection.connection.execute(sql)
    @result = @result.each(as: :array)
  end

end