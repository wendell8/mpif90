# Exemplo de Comunicação Paralela com MPI

Este repositório contém um programa em Fortran que demonstra como usar o MPI (Interface de Passagem de Mensagens) para comunicação paralela entre processos. O programa cria uma matriz e a distribui entre diferentes processos, mostrando um exemplo básico de computação paralela.

## O que o Programa Faz

O código Fortran fornecido (`communicator.f90`) realiza as seguintes tarefas:

1. Importa módulos e bibliotecas necessários.
2. Declara variáveis inteiras `n`, `i` e `m` para as dimensões da matriz e contadores.
3. Declara variáveis `erro`, `NpMpi` e `IdMpi` para lidar com erros, número de processos MPI e identificador do processo.
4. Declara uma matriz alocável `a` de tamanho `n` por `m`.
5. Inicializa o ambiente MPI usando `MPI_INIT`.
6. Recupera o número total de processos MPI usando `MPI_COMM_SIZE` e o identificador do processo atual usando `MPI_COMM_RANK`.
7. Aloca memória para a matriz `a`.
8. Se o processo tiver identificador 0 (`IdMpi==0`):
   - Define os valores da primeira linha da matriz `a` como [1, 2, 3, 4].
   - Define os valores da segunda linha da matriz `a` como [5, 6, 7, 8].
   - Define os valores da terceira linha da matriz `a` como [9, 10, 11, 12].
9. Para outros processos:
   - Inicializa todas as linhas da matriz `a` com zeros.
10. Imprime a matriz `a` antes da comunicação.
11. Sincroniza todos os processos usando `mpi_barrier` para garantir que todos alcancem o mesmo ponto antes de prosseguir.
12. Realiza uma operação de transmissão (broadcast), transmitindo a submatriz `a(1,1)` de tamanho `n*n` do processo 0 para todos os outros processos usando `mpi_bcast`.
13. Imprime a matriz `a` após a comunicação.
14. Finaliza o ambiente MPI usando `MPI_FINALIZE`.

## Uso

1. Certifique-se de ter uma biblioteca MPI instalada em seu sistema.
2. Compile o programa usando um compilador Fortran que suporte MPI. Por exemplo:
   'mpif90 -o communicator communicator.f90'
3. Execute o executável:
   'mpirun -np <num_processos> ./communicator'
   Substitua `<num_processos>` pelo número desejado de processos MPI.
4. Observe a comunicação e as atualizações na matriz na saída.

## Contribuições

Contribuições são bem-vindas! Se encontrares problemas ou melhorias, sinta-se à vontade para abrir um problema ou criar um pull request.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).

