program nbody
use parameters
implicit none
integer::frame,step
real*8::pos(nparticle,3),vel(nparticle,3),force(nparticle,3),m(nparticle)
real*8::potE,kinE

step=1
call read_init(m,step,pos, vel)
! print*,"m"
! print*,m
! print*,"pos"
! print*,pos
! print*,"vel"
! print*,vel

! call calc_forces(m,pos,force,potE)
! print*,force


do frame=step,nsteps
    call calc_forces(m,pos,force,potE)
    call move_particles(m,pos,vel,force,kinE)
    call write_output(frame,m,pos,vel,potE,kinE)
end do


end program nbody
