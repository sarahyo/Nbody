subroutine calc_forces(m,pos,forces,PE)
    use parameters
    implicit none
    integer::i,j,k
    real*8::m(nparticle),pos(nparticle,3),forces(nparticle,3)
    real*8::rij(3),fij(3)
    real*8:: PE,rij_mag
    forces=0.0

    do i=1,nparticle-1
        do j=i+1,nparticle
            do k=1,3
                rij(k)=pos(i,k)-pos(j,k)
            end do
            rij_mag=sqrt(dot_product(rij,rij))
           
            PE = PE - g*m(i)*m(j)/rij_mag
           ! fij=g*m(i)*m(j)*rij/(rij_mag*rij_mag*rij_mag)
            fij=g*m(i)*m(j)*rij/(rij_mag+reg)**3.0
            do k=1,3
                forces(i,k)= forces(i,k) - fij(k)
                forces(j,k)= forces(j,k) + fij(k)
            end do
            
        end do
    end do

end subroutine calc_forces
