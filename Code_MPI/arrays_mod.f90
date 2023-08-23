!***********************************************************************************
!* Programa: Módulo da régra do trapezio aplicado em MPI - Código de Inicialização *
!* Aluno:  Sebastião Wendell Nobre Moura                                           *
!* Universidade:  Universidade Federal do Pará                                     *
!* Data:  Agosto de 2023                                                           *
!* Minicurso: Introdução à programação em paralelo em Fortran com a biblioteca MPI *
!* Professor: Anderson Piedade                                                     *
!***********************************************************************************


module trap_mod
    
contains

real function f(x)
implicit none
real, intent(in) :: x
f = exp(x)*sin(x)
end function
!-----
real function fan(a,b)
implicit none
real, intent(in) :: a,b
real :: fb,fa

fb = exp(b) * ( sin(b) - cos(b) )
fa = exp(a) * ( sin(a) - cos(a) )
fan = 0.5 * (fb - fa)

end function

subroutine para_range(n1, n2, nprocs, irank, ista, iend)
    implicit none
    integer,intent(in)  :: n1, n2, nprocs, irank
    integer,intent(out) :: ista, iend
    
    integer :: iwork1, iwork2
    
    iwork1 = (n2 - n1 + 1) / nprocs
    iwork2 = MOD(n2 - n1 + 1, nprocs)
    ista   = irank * iwork1 + n1 + MIN(irank, iwork2)
    iend   = ista + iwork1 - 1
    if (iwork2 > irank) iend = iend + 1
        
    end subroutine


end module