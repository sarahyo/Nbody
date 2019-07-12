subroutine read_init(mass,step,pos,vel)
    use parameters
    implicit none
    real*8::pos(nparticle,3),vel(nparticle,3),mass(nparticle)
    integer::j,k,step
    ! character(len=5)::particleName
    logical::file_exists
    step=1
        inquire(file='checkpoint.mrv',exist=file_exists)
        if (file_exists) then
            open(11,file='checkpoint.mrv')
              read(11,*)
              read(11,*)
              read(11,*)
              do j=1,nparticle
                ! read(11, '(f8.3,3f8.3,3f8.4)')mass(j),(pos(J, k), k= 1, 3), (vel(J, k), k = 1, 3) 
                 read(11, *)step,mass(j),(pos(J, k), k= 1, 3), (vel(J, k), k = 1, 3)
              end do
            close(11) 
        
        else
            print*,"file do not exists"
            open(11,file=inputfile)
            read(11,*)
            read(11,*)
            read(11,*)
            do j=1,nparticle
                ! read(11, '(f8.3,3f8.3,3f8.4)')mass(j),(pos(J, k), k= 1, 3), (vel(J, k), k = 1, 3) 
                read(11, *)mass(j),(pos(J, k), k= 1, 3), (vel(J, k), k = 1, 3)
            end do
            close(11)
        end if    
end subroutine read_init
