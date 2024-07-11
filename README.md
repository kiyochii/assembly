
# Configuração para Programação em Assembly x86 no Linux

## IDE Recomendada

Recomendamos usar um editor de texto avançado, como:
- Visual Studio Code
- Sublime Text

## Instalação do Assembler (NASM)

Para montar código assembly x86 no Linux, usamos o NASM (Netwide Assembler):

```bash
sudo apt update
sudo apt install nasm
```

# Compilando
    Primeiramente precisamos criar um arquivo .asm, nos exemplos utilizaremos um com o nome de
    helloworld.asm
 ```bash
    nasm -f elf32 helloworld.asm -o helloworld.o   # Monta o arquivo hello.asm para formato ELF 64-bit
    ld -m elf_i386 helloworld.o -o helloworld
```
# Depuração
    Para a depuração poderá ser utilizado o GDB (GNU Debugger)