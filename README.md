# Rise-after-fall
It includes matlab simulation for humanoid body to rise up on it's foot after being fallen 

## GOAL
The goal of this simulation is to design an algorithm for our full humanoid, which can make it
stand again on its feet after being fallen.
Standing on two feet become extremely important as the robot can fall with any kind of
uncertainty in its path, the uncertainty may be an external impulse, uneven path etc. A
standing-up routine is triggered when the robot has fallen over with high certainty. To determine
this state the attitude sensors are interpreted. If the robot is tilted more than 45◦ for more than
one second, we assume that the robot has fallen.
So it is most important to stand it up again on its feet after being fallen.

## Approach to this model
Every model of simulation is inspired by human-like motions.
There are many possible ways in which humans can rise from the lay position. Different kind of
humanoid designs might be suitable for different models.
The common rising model which humans follow while standing up is one that uses one arm to
support while standing and first leg curl over other. With the support of arm, body lift it's weight
and eventually rises on its feet.
This model requires minimum over-all energy but torque required on arm joints is very high.
So we could not use this model.
Then comes the spinal model where the robot uses biped to rise torso and torso part to rise
biped. For our case, the spinal model is best because it focuses on lateral symmetry and divide
load of each task equally for symmetrical actuators.

## Algorithm:
Spinal model of rising can be divided into five parts:
### 1. Laying to back plank pose: 
Torso rise with arm help: While giving clockwise angle to shaft
of the actuator at pelvis, there are two possibilities that either leg move clockwise or torso
anticlockwise. In such case the servo select one with less torque.
So firstly we are rotating torso with the support of arms(arms do provide an upward force to
torso and torque required for rising torso become much less than that for leg).

### 2. Biped fold pose: 
After plank pose, humanoid has to fold his legs, for which arms are kept
stationary and legs are raised where one actuator support other to raise biped and fold it. This
fold is done in order to reduce the distance between torso and ankle, as the ankle will rotate
pelvis in subsequent steps. Up to this step, body is supported by pelvis, ankle and arm end.

### 3. Reclined thunderbolt pose: 
This step involves arm and ankle balancing and pelvis motion in
an arc. This is done in order to increase area of support polygon while back straightening. Back
straightening involves detaching of arm end from ground, so toppling changes increases. Leg
fold is taken left to ankle in order to keep com near ankle(torso is rightwards and legs on left to
ankle). Along with this lower leg is on ground thereby increasing left support area.

### 4. Straightening of the back(torso):
After Reclined pose, pelvis actuator will rotate
anticlockwise to make torso verticle. Due to leg fold, Centre of mass is always left to ankle and
on support polygon. This step requires the most torque in the whole model.

### 5. Standing from thunderbolt pose: 
In this step humanoid stands from sitting
position(thunderbolt pose). For this projection of Com is kept under support polygon i.e. area of
foot. With this COM is moved vertically upward and eventually the whole humanoid stands.

## Design constraints on the simulation model
One of the challenges for simulation is the width of pelvis plate which creates an offset to joint
points, and while turning torso from upper leg, offset drags on the ground.
This may restrict the correct order of motion.
Along with this randomness of pelvis’ servo is needed to be handled. As unexpected motion
may occur on rotating servo of the pelvis as these servos only are responsible to lift torso or
biped.
### Solution Implemented in this simulation: 
For offset problem, the torso part is extended below
pelvis and that point instead of pelvis joint is kept on ground. This allows other servos to lift
pelvis in order to sustain offset.
And for ‘one servo two lifting’ problem, arms and biped are used each at different time to avoid
confusion. Less torque is always maintained in the lift of interest.
