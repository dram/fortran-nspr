module nspr
  use iso_c_binding

  implicit none

  include "constants.f90"

  interface
     pure function pl_strlen(str) &
          bind(c, name="PL_strlen")
       use iso_c_binding, only: c_int32_t, c_ptr
       type(c_ptr), value :: str
       integer(c_int32_t) pl_strlen
     end function pl_strlen

     function pr_create_process(path, argv, envp, attr) &
          bind(c, name="PR_CreateProcess")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: path, argv, envp, attr
       type(c_ptr) pr_create_process
     end function pr_create_process

     function pr_detach_process(process) &
          bind(c, name="PR_DetachProcess")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: process
       integer(c_int) pr_detach_process
     end function pr_detach_process

     function pr_mk_dir(name, mode) &
          bind(c, name="PR_MkDir")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: name
       integer(c_int), value :: mode
       integer(c_int) pr_mk_dir
     end function pr_mk_dir

     function pr_wait_process(process, exit_code) &
          bind(c, name="PR_WaitProcess")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: process, exit_code
       integer(c_int) pr_wait_process
     end function pr_wait_process
  end interface
end module nspr
