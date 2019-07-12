program test
implicit none
logical::file_exists

inquire(file='out',exist=file_exists)
if (file_exists) then 
    print*,"file exists"
else
    print*,"file do not exists"
end if

end program test
