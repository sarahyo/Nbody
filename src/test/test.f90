program test
implicit none
integer::i
open(11,file='out',STATUS='REPLACE')
do i=1,10
    write(11,*)i
end do
close(11)

open (11,file='out',STATUS='REPLACE')
write(11,*)"hhello"
close(11)
end program test
