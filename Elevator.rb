require_relative 'Person'
require_relative 'Simulation'

class Elevator < Person
   attr_accessor :location, :call_order, :elevator_status, :direction

  def initialize(args = {})
    @location = args[:floor] || 1
    @call_order = []
    @elevator_status = :still
    @direction = :still
  end

  def request_elevator
    
    call_order.each do |push_button|
      @elevator_status = :moving
      if @location < push_button.floor
        @direction = :up
        drive_to(push_button.floor)
      elsif @location > push_button.floor
        @direction = :down
        drive_to(push_button.floor)
      else
        @direction = :still
        doors_open
      end
    end 
  end

  def drive_to(floor)
   
  end

  def doors_open 
    @elevator_status = :still
  end

  def to_s
    "The elevator is currently at #{location} and the status of this elevator is #{elevator_status} and the elevator is currently going #{direction} \n" +
    "The current waiting order is: #{call_order}" 
  end

end