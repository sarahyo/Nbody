# Start of the Makefile
# Defining variables
objects = move_particles
#======================
# Fortran 90 compiler
# (Uncomment only one)
#======================
# GNU
F90 = gfortran
#---------------------
# Intel
#F90 = ifort
#---------------------
Base= $(shell cd .. && pwd)
# Makefile
out:

	$(shell cd $(Base)/src && $(F90) $(Base)/src/*.f90)
	$(shell mv $(Base)/src/a.out $(Base)/bin/Nbody)

# Cleaning everything
clean:
	 rm  $(Base)/bin/Nbody
#	 rm $(objects)
	 rm $(Base)/*.data 
	 rm $(Base)/*.mrv
	 rm $(Base)/*.xyz
      #	rm $(Base)/fort.*
# End of the makefile
