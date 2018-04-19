program main
  use iso_c_binding
  use nspr

  implicit none

  type string
     character(:), allocatable :: value
  end type string

  block
    character(:), allocatable, target :: buffer
    integer(c_int32_t) i

    buffer = "text" // char(0)
    i = pl_strlen(c_loc(buffer))
    print *, "pl_strlen", i

    call run_process('/bin/ls', [string('-a'), string('-l')])
  end block

contains

  subroutine run_process(command, arguments)
    character(*), intent(in) :: command
    type(string), intent(in) :: arguments (:)

    integer i
    type(c_ptr) process
    type(c_ptr), target :: pointers (size(arguments) + 2)
    type(string), target :: buffer (size(arguments) + 1)

    buffer(1) = string(command // char(0))
    do i = 1, size(arguments)
       buffer(i + 1) = string(arguments(i) % value // char(0))
    end do

    do i = 1, size(arguments) + 1
       pointers(i) = c_loc(buffer(i) % value)
    end do
    pointers(i) = c_null_ptr

    process = pr_create_process( &
         pointers(1), c_loc(pointers), c_null_ptr, c_null_ptr)

    i = pr_wait_process(process, c_null_ptr)
  end subroutine run_process

end program main
