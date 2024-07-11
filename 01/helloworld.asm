
section	.text
   global _start
_start:	            ;tells linker entry point
   mov	edx,len     ;tamanho da msg
   mov	ecx,msg     ;string da msg, que foi declarada na section.data
   mov	ebx,1       ;file descriptor (stdout)

   ;0: stdin (entrada padrão) - usado para entrada de dados.
   ;1: stdout (saída padrão) - usado para saída de dados.
   ;2: stderr (erro padrão) - usado para saída de mensagens de erro.
   mov	eax,4       ;numero de chamada do sistema (sys_write) sera usado qnd chamar o kernel
   int	0x80        ;chama o kernel
  
;  No Linux, as chamadas de sistema são feitas configurando
;os registradores com os parâmetros necessários e, em seguida,
;executando a instrução int 0x80 para invocar o kernel.


;   Aqui está a configuração para sys_write:
;eax: Número da chamada de sistema (4 para sys_write). cada op do sistema tem um numero
;ebx: File descriptor (1 para stdout).
;ecx: Ponteiro para o buffer (mensagem a ser escrita).
;        P.S. Buffer eh um lugar da memoria fisica
;      utilizada para armazenar dados temporariamente 
;      enquanto esta sendo movida de um lugar para outro
;edx: Número de bytes a serem escritos (comprimento da mensagem).	

   mov	eax,1       ;numero de chamada do sistema para saida (sys_exit)
   int	0x80        ;chama o kernel que vai realizar o sys_exit



section	.data ;declarando variaveis e constantes
msg db 'Hello, world!', 0xa  ;string para sem impressa
len equ $ - msg;calcula o tamanho da string