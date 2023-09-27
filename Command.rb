# Command interface
class Command
  def execute
    raise NotImplementedError, "#{self.class} must implement the execute method"
  end
end

# Receiver
class Light
  def turn_on
    puts "Light is on"
  end

  def turn_off
    puts "Light is off"
  end
end

# Concrete Command
class LightOnCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_on
  end
end

class LightOffCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_off
  end
end

# Invoker
class RemoteControl
  def initialize
    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def execute_commands
    @commands.each(&:execute)
  end
end

# Client code
light = Light.new
light_on = LightOnCommand.new(light)
light_off = LightOffCommand.new(light)

remote = RemoteControl.new
remote.add_command(light_on)
remote.add_command(light_off)

remote.execute_commands
