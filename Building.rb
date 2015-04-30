require_relative 'Elevator'
require_relative 'Simulation'
require_relative 'Person'
class Building < Elevator
 attr_accessor :number_of_floors, :number_of_elevators, :elevator, :line_order

  def initialize(args = {})
    @number_of_floors = args[:floors] || 3
    @number_of_elevators = args[:elevator] || 1
    @line_order = []
    @elevator = []

    1.upto(@number_of_elevators) do |num|
      @elevator << Elevator.new(floor: (1..number_of_floors).to_a.sample)
    end
  end

  def elevator_arrived
    puts "THE ELEVATOR SIMULATOR:"
    @elevator.each do |elevators|
      puts elevators
    end
  end

  def is_closest(elevators, push_button)
    distance_from = elevator.map {|x| (x.location-push_button.floor).abs }
    distance_from.index(distance_from.min) == elevator.index(elevators) 
  end

  def shortest_line
    elevator.sort_by {|x| x.call_order.length}.first
  end

end
