
!***********************************************************************************
!* Programa: Exemplo de Programação em MPI - Código de Inicialização               *
!* Aluno:  Sebastião Wendell Nobre Moura                                           *
!* Universidade:  Universidade Federal do Pará                                     *
!* Data:  Agosto de 2023                                                           *
!* Minicurso: Introdução à programação em paralelo em Fortran com a biblioteca MPI *
!* Professor: Anderson Piedade                                                     *
!***********************************************************************************


program comunicator
    use trap_mod
    implicit none
    include 'mpif.h'

    integer :: n,i, m
    Integer:: erro, NpMpi, IdMpi
    integer,allocatable:: a(:,:)

    n = 3
    m = 4
  
    call MPI_INIT(erro)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,NpMPI, erro)
    call MPI_COMM_RANK(MPI_COMM_WORLD,IdMPI,erro)

    allocate(a(n,m))    
    
    if(IdMpi==0)then
        a(1,:) = (/1,2,3,4/)
        a(2,:) = (/5,6,7,8/)
        a(3,:) = (/9,10,11,12/)
    else
        do i = 1,n
            a(i,:) = 0
        end do
    end if

    print*,'Antes',a

    call mpi_barrier(MPI_COMM_WORLD)
    call mpi_bcast(a(1,1),n*n, mpi_integer, 0, MPI_COMM_WORLD, erro)
    print*,"Depois",a

    call MPI_FINALIZE(erro)
    
end program

    