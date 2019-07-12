subroutine write_output(frame,mass,pos,vel,potE,kinE)
use parameters
implicit none
integer::i,j,k
integer::frame,step
real*8::pos(nparticle,3),vel(nparticle,3), mass(nparticle)
real*8::potE,kinE,time,totE
logical::file_exists
! if (frame .eq. 1) then
    open(91,file='trajectory.xyz')
    write(91,*) nparticle
    write(91,*) 
    open(92,file='energy.data')
    open(94,file='orbit2.data')
    inquire(file='orbit.data',exist=file_exists)
    if (file_exists) then
        open(93,file='orbit.data',Access = 'append',Status='old')
    else
        open(93,file='orbit.data') 
    endif
!    open(93,file='orbit.data',Access = 'append',Status='old') 
! end if
step=frame-1
time=dt*(step)

if (mod(step,stride) .eq. 0 ) then
    do i=1,nparticle
        write(91,*)i,(pos(i,k), k = 1, 3)
        write(93,*)time,pos(1,1),pos(1,2),pos(2,1),pos(2,2),pos(3,1),pos(3,2),pos(4,1),pos(4,2),pos(5,1),pos(5,2)!,pos(6,1),pos(6,2),pos(7,1),pos(7,2),pos(8,1),pos(8,2),pos(9,1),pos(9,2)
        write(94,*)time,pos(6,1),pos(6,2),pos(7,1),pos(7,2),pos(8,1),pos(8,2),pos(9,1),pos(9,2)
        ! write(93,'(i8,3f8.3,3f8.3)',advance='No')step, mass(i),(pos(i, k), k= 1, 2)
        ! write(93,*)step, mass(i),(pos(i, k), k= 1, 2)
    end do
! end if
! if (mod(step,stride) .eq. 0) then 
    write(*,*)"writing checkpoint file"
    open (95,file='checkpoint.mrv',STATUS='REPLACE')
    write(95,*)
    write(95,*)nparticle
    write(95,*)
    !$OMP PARALLEL
    do j=1,nparticle 
         write(95,*)step,mass(j),(pos(J, k), k= 1, 3), (vel(J, k), k = 1, 3)
        !  print*,frame
    end do
    !$OMP END PARALLEL
    close(95)
    ! pause
endif     
! time=dt*(frame-1)
totE=potE+kinE
write(92,*)time,potE,kinE,totE

if (mod((frame-1),stride*10) .eq. 0) then
    print*,"current time step:", frame
end if
if (frame==nsteps) then
close(91)
close(92)
close(94)

end if

end subroutine write_output
