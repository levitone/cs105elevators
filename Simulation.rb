require_relative 'Elevator'
require_relative 'Simulation'
require_relative 'Building'
class Simulation < Building 
  attr_accessor :number_of_floors, :number_of_elevators, :elevator, :line_order
  def simulate
      line_order << Person.new(floor: (1..number_of_floors).to_a.sample, direction: [:up, :down].sample)
      make_request
      elevator_arrived
  end
end