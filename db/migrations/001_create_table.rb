require 'sequel'
require 'sqlite3'

environments = ["test", "development"]

environments.each do |env|
  Sequel.sqlite("db/robot_world_#{env}.sqlite3").create_table(:robots) do
    primary_key :id
    String      :title
    String      :description
  end
  puts "migrated #{env} environment."
end
