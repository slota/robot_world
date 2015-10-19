class RobotWorld
  def self.create(robot)
    database.from(:robots).insert(data)
  end

  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_world_development.sqlite3")
    end
  end

  def self.raw_robots
    database.from(:robots).insert(data)
  end

  def self.all
    robots = database.from(:robots).to_a
    robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def self.update(id, data)
    database.from(:robots).where(:id => id).update(data)
  end

  def self.find(id)
    robot = database.from(:robots).where(:id=>id).to_a.first
    Robot.new(robot)
  end

  def self.create(data)
    database.from(:robots).insert(data)
  end

  def self.dataset
    database.from(:tasks)
  end

end
