# Airport Challenge

The Airport Challenge is a software implementation of a working airport, with planes, passengers, & a simulation of weather conditions. The task is to design the domain model, and write each class in Ruby with its respective methods fully test-driven with Rspec.

## Class Responsibility Collaborators

### Class - Plane

Responsibilites	| Collaborators
----------------|---------------
Take off	      | Airport
Be flying	      |
Land	          | Airport

### Class - Airport

Responsibilities  |	Collaborators
------------------|---------------
Hold planes	      | Plane
Be full	          | Plane
Be empty	        | Plane
Check the weather	| Weather
land planes	      | Plane, Weather
Take off planes	  | Plane, Weather

### Module - Weather

The weather module is responsible for returning a generated random number representing the probability of a storm and determining whether the weather is stormy or clear. Planes can only take off and land only in less severe or clear weather.
