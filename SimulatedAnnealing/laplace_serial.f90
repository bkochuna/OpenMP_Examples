!*************************************************
! Laplace Serial Fortran Version
!
! Temperature is initially 0.0
! Boundaries are as follows:
!
!      0         T         0
!   0  +-------------------+  0
!      |                   |
!      |                   |
!      |                   |
!   T  |                   |  T
!      |                   |
!      |                   |
!      |                   |
!   0  +-------------------+ 100
!      0         T        100
!
!  John Urbanic, PSC 2014
!
!*************************************************
program serial
      implicit none

      !Size of plate
      integer, parameter             :: columns=1000
      integer, parameter             :: rows=1000
      double precision, parameter    :: max_temp_error=0.01

      integer                        :: i, j, max_iterations, iteration=1
      real(8)                        :: dt=100.0
      integer                        :: start_time, stop_time, count_rate

      real(8), dimension(0:rows+1,0:columns+1) :: temperature, temperature_last

      max_iterations=4000

      call system_clock(start_time,count_rate)      !Fortran timer

      call initialize(temperature_last)

      !do until error is minimal or until maximum steps
      do while ( dt > max_temp_error .and. iteration <= max_iterations)

         do j=1,columns
            do i=1,rows
               temperature(i,j)=0.25*(temperature_last(i+1,j)+temperature(i-1,j)+ &
                                      temperature_last(i,j+1)+temperature(i,j-1) )
            enddo
         enddo

         dt=0.0

         !copy grid to old grid for next iteration and find max change
         do j=1,columns
            do i=1,rows
               dt = max( abs(temperature(i,j) - temperature_last(i,j)), dt )
               temperature_last(i,j) = temperature(i,j)
            enddo
         enddo

         !periodically print test values
         if( mod(iteration,100).eq.0 ) then
            call track_progress(temperature, iteration)
         endif

         iteration = iteration+1

      enddo

      call system_clock(stop_time)

      print*, 'Max error at iteration ', iteration-1, ' was ',dt
      print*, 'Total time was ',REAL(stop_time-start_time,4)/REAL(count_rate,4), ' seconds.'

contains

! initialize plate and boundery conditions
! temp_last is used to to start first iteration
subroutine initialize( temperature_last )
      INTEGER :: i,j
      REAL(8) :: temperature_last(0:rows+1,0:columns+1)

      temperature_last = 0.0

      !these boundary conditions never change throughout run

      !set left side to 0 and right to linear increase
      do i=0,rows+1
         temperature_last(i,0) = 0.0
         temperature_last(i,columns+1) = (100.0/rows) * i
      enddo

      !set top to 0 and bottom to linear increase
      do j=0,columns+1
         temperature_last(0,j) = 0.0
         temperature_last(rows+1,j) = ((100.0)/columns) * j
      enddo

end subroutine initialize

!print diagonal in bottom corner where most action is
subroutine track_progress(temperature, iteration)
      INTEGER :: i,iteration
      REAL(8) :: temperature(0:rows+1,0:columns+1)

      print *, '---------- Iteration number: ', iteration, ' ---------------'
      do i=5,0,-1
         write (*,'("("i4,",",i4,"):",f6.2,"  ")',advance='no'), &
                   rows-i,columns-i,temperature(rows-i,columns-i)
      enddo
      print *
end subroutine track_progress

end program serial
