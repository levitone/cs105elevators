require_relative 'Elevator'
require_relative 'Simulation'

class Person
  attr_accessor :floor, :direction, :full, :number_of_people

  def initialize(args = {})
    @floor = args[:floor]
    @direction = args[:direction]
    @full = false
    @number_of_people = args[:number_of_people] || rand(1..10)

  end

  def make_request
    push_button= line_order.pop
    @elevator.each do |elevators|
      if elevators.elevator_status == :still && push_button.floor == elevators.location && elevators == shortest_line 
        call_elevator(elevators,push_button)
        
      end
    end

    @elevator.each do |elevators|
      if elevators.elevator_status == :still && push_button.floor == elevators.location
        call_elevator(elevators,push_button)
        
      end
    end

    @elevator.each do |elevators|
      if elevators.elevator_status == :still && is_closest(elevators, push_button) 
        call_elevator(elevators,push_button)
        
      end
    end
    call_elevator(shortest_line,push_button) 
  end
  def call_elevator(elevators,push_button)
    push_button.full = true
    elevators.call_order << push_button
    elevators.request_elevator
  end
  def to_s
    "This person #{number_of_people} requested to go to floor # #{floor}  and the elevator is currently going in the #{direction} direction.\n"+"The elevator is #{full}. If it true it is full, if it is false it is not full"
  end
end