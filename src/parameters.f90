module parameters
implicit none
! number of particles
integer,parameter::nparticle=9
! number of timesteps to run simulation
integer,parameter::nsteps=1000000
! particles names for output trajectory
character (len=3),parameter:: sun='sun'
character (len=4),parameter:: merc='merc'
character (len=3),parameter:: ven='ven'
character (len=5),parameter:: earth='earth'
character (len=4),parameter:: mars='mars'
character (len=5):: particles_name(nparticle)
! particles_name(1)="sun"
! particles_name(2)="merc"
! particles_name(3)="ven"
! particles_name(4)="earth"
! particles_name(5)="mars"

! gravitational constant G
!In astrophysics, it is convenient to measure distances in parsecs (pc), velocities in kilometers per second (km/s) and masses in solar units M⊙. In these units, the gravitational constant is:
!real,parameter::g=4.302e-3 !(pc)(M⊙)**-1(Km/s)**2
!For situations where tides are important, the relevant length scales are solar radii rather than parsecs. In these units, the gravitational constant is:
!real,parameter::g=1.90809e5 !(R⊙)(M⊙)**-1(Km/s)**2
real,parameter:: g=39.478 !(AU)**3(yr)**-2(M⊙)**-1
!regularization parameter to avoid collisions
real,parameter::reg=0.01

! Mass of each particle, M⊙ 

!time step for simulation
real,parameter:: dt=0.015625

!frequency to write to trajectory and log files
integer,parameter:: stride=10

!name of input file for simulation 
character(len=*),parameter::inputfile='initialCondition.dat'

end module parameters
