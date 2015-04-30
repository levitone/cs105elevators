require_relative 'Elevator'
require_relative 'Person'
require_relative 'Building'
require_relative 'Simulation'

describe Elevator do 

	it "creating an Elevator:"
		elevator = Elevator.new
		expect(elevator).to be_a Elevator
	end

	it "creating an elevator stopped on the 2nd floor"
		elevator = Elevator.new(floor: 2)
		expect(location).to eq (2)
	end
end

describe Person do

	it "creating a person that gets on at the first floor"
		elevator_called = Person.new(floor: 1)
		elevator_called.should_be_instance_of Person
		expect(elevator_called).to be_a Person
		elevator_called.floor.should eq(1)
	end

	it "creating a person that gets on at the first floor and is going up to floor 2"
		elevator_called = Person.new(floor: 1 direction: :up)
		elevator_called.should_be_instance_of Person
		expect(elevator_called).to be_a Person
		elevator_called.floor.should eq(1)
		elevator_called.should eq(:down)
	end
end

describe Simulation do 
	it "create 2 elevators" do
		sim = Elevator.new(elevator: 2)
		expect(simulation.elevator.count).to eq(2)
	end

	it "creates a priority to go to the nearest elevator that is waiting"
		sim.elevator[2].call_order.should be_empty
		sim.elevator[1].current_floor = 1
		sim.elevator[0].current_floor = 0
		sim.line_order << Elevator.new(floor: 1 direction: :up)
		sim.ordering
	end

end
