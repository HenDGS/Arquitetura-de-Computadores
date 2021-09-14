.equ SEG_A,0x80 @Nomes mais fáceis para guardar os segmentos
.equ SEG_B,0x40
.equ SEG_C,0x20
.equ SEG_D,0x08
.equ SEG_E,0x04
.equ SEG_F,0x02
.equ SEG_G,0x01
.equ SEG_P,0x10
.text

swi 0x206 		@Limpa o display no inicio
mov r0,#0 		@Inicialização das variaveis
mov r1,#0
mov r2,#'-
mov r4,#0 
swi 0x207 		@Imprime o primeiro caracter no canto esquerdo
mov r0,#1
swi 0x201 		@Inicializa o led esquerdo, pois cursor inicial não é espaço 
	mov r0,#SEG_A
	add r0,r0,#SEG_B
	add r0,r0,#SEG_C
	add r0,r0,#SEG_D
	add r0,r0,#SEG_E
	add r0,r0,#SEG_G
	swi 0x200 			@Começa com o display em 0
mov r8,#0 


Loop: @loop principal		
	swi 0x203		@Input da tecla azul
	cmp r0, #2
	beq K1
	cmp r0, #8
	beq K2
	cmp r0, #16
	beq K3
	cmp r0, #64
	beq K4
	cmp r0, #128
	beq K5
	cmp r0, #512
	beq K6
	cmp r0, #2048
	beq K7
	cmp r0, #16384
	beq K8
	cmp r0, #32768
	beq K9
	cmp r0, #4096
	beq K10  @Usado como seta esquerda da letra d), já que a esquerda "normal" já é usada para andar
	cmp r0, #8192 
	beq K11  @Usado como seta direita da letra d)
	Display: @Display é atualizado de acordo com a chegada no primeiro número da porcentagem. (Funcinando no debug, mas na prática parando no primeiro número)
		cmp r8,#60
		beq D1
		cmp r8,#120
		beq D2
		cmp r8,#180
		beq D3
		cmp r8,#240
		beq D4
		cmp r8,#300
		beq D5
		cmp r8,#360
		beq D6
		cmp r8,#420
		beq D7
		cmp r8,#480
		beq D8
		cmp r8,#540
		beq D9
		cmp r8,#600
		beq D10
	cmp r2,#' 
	beq subtrai   @Subtrai do contador se o digito for espaço
	cmp r2,#'-
	beq soma 	   @Soma se o digito for diferente
		
	b Loop
	
soma:
	add r8,r8,#1
	b Loop

subtrai:
	sub r8,r8,#1
	b Loop

K1:
	mov r0,r4
	sub r1,r1,#1
	swi 0x207
	b Loop
K2:
	mov r2,#' 
	mov r0,#2
	swi 0x201 	@Acende o led direito, pois caractere é espaço
	b Loop
K3:	
	mov r0,r4
	sub r0,r0,#1
	mov r4,r0
	swi 0x207
	b Loop 
K4:
	mov r0,r4
	add r0,r0,#1
	mov r4,r0
	swi 0x207
	b Loop 
K5:
	mov r2,#'#
	mov r0,#1
	swi 0x201
	b Loop
K6:
	mov r0,r4
	add r1,r1,#1
	swi 0x207
	b Loop
K7:
	mov r2,#'*
	mov r0,#1
	swi 0x201
	b Loop
K8:
	mov r2,#'O
	mov r0,#1
	swi 0x201
	b Loop
K9:
	mov r2,#'-
	mov r0,#1
	swi 0x201
	b Loop
K10: 					@Comando para apagar todo o lcd
	swi 0x206
	b Loop
K11: 					@Loop para preencher o lcd com "#"
	mov r2,#'#
	MOV  R0, #0  ;Init the character
	MOV R1, #0
	Lupa:		
		Lupo:
			swi 0x207
			ADD  R0, R0, #1 ;Increment it
			CMP R0, #39
			BLE Lupo
		MOV R0, #0
		ADD  R1, R1, #1 ;Increment it
		CMP R1, #14
	BLE  Lupa  ;Loop if not finished

	b Loop

D0:
	mov r0,#SEG_A
	add r0,r0,#SEG_B
	add r0,r0,#SEG_C
	add r0,r0,#SEG_D
	add r0,r0,#SEG_E
	add r0,r0,#SEG_G
	swi 0x200 
	b Loop
D1:
	mov r0,#SEG_B
	add r0,r0,#SEG_C
	swi 0x200 
	b Loop
D2:
	mov r0,#SEG_A
	add r0,r0,#SEG_B
	add r0,r0,#SEG_F
	add r0,r0,#SEG_E
	add r0,r0,#SEG_D
	swi 0x200 
	b Loop
D3:
	mov r0,#SEG_A
	add r0,r0,#SEG_B
	add r0,r0,#SEG_F
	add r0,r0,#SEG_C
	add r0,r0,#SEG_D
	swi 0x200 
	b Loop
D4:
	mov r0,#SEG_G
	add r0,r0,#SEG_F
	add r0,r0,#SEG_B
	add r0,r0,#SEG_C
	swi 0x200 
	b Loop

D5:
	mov r0,#SEG_A
	add r0,r0,#SEG_G
	add r0,r0,#SEG_F
	add r0,r0,#SEG_C
	add r0,r0,#SEG_D
	swi 0x200 
	b Loop
D6:
	mov r0,#SEG_A
	add r0,r0,#SEG_G
	add r0,r0,#SEG_F
	add r0,r0,#SEG_E
	add r0,r0,#SEG_D
	add r0,r0,#SEG_C
	swi 0x200 
	b Loop
D7:
	mov r0,#SEG_A
	add r0,r0,#SEG_B
	add r0,r0,#SEG_C
	swi 0x200 
	b Loop
D8:
	mov r0,#SEG_A
	add r0,r0,#SEG_B
	add r0,r0,#SEG_C
	add r0,r0,#SEG_D
	add r0,r0,#SEG_E
	add r0,r0,#SEG_F
	add r0,r0,#SEG_G
	swi 0x200 
	b Loop
D9:
	mov r0,#SEG_A
	add r0,r0,#SEG_B
	add r0,r0,#SEG_F
	add r0,r0,#SEG_G
	add r0,r0,#SEG_C
	swi 0x200 
	b Loop
D10:
	mov r0,#SEG_A
	add r0,r0,#SEG_G
	add r0,r0,#SEG_E
	add r0,r0,#SEG_F
	add r0,r0,#SEG_B
	add r0,r0,#SEG_C
	swi 0x200 
	b Loop




stop:   b stop