subroutine move_particles(mass,pos,vel,forces,kinE)
    use parameters
    implicit none
    integer::i,k
    real*8::mass(nparticle),pos(nparticle,3),vel(nparticle,3),forces(nparticle,3)
    real*8::kinE,acc,v1(3),v0

    do i=2,nparticle
       
        do k=1,3
            v0=(vel(i,k))
            acc=forces(i,k)*(1.0/mass(i))
            v1(k)= v0+dt*acc
            vel(i,k) = v1(k)
            pos(i,k) = pos(i,k) + dt*vel(i,k)
        end do
        
        KinE=KinE+(.5*mass(i)*dot_product(v1,v1))
        print*,kinE
    end do
    
end subroutine move_particles
