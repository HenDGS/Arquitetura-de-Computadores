@C�digo que conta a quantidade de alunos aprovados em uma determinada
disciplina (media maior ou igual a 60 e frequ�ncia maior ou igual a 75). As
m�dias est�o armazenadas em valores de 8 bits em mem�ria a partir do
endere�o indicado por R0, e as frequ�ncias est�o armazenadas em valores de 8
bits em mem�ria a partir do endere�o indicado por R1. A quantidade total de
alunos est� armazenada em R2, e o resultado calculado da quantidade de alunos
aprovados deve ser armazenada em R3.


loop:	
	SUB R7,#1@R7--
	AND R0,R1@Verifica se o aluno teve frequencia e media
	BZ loop@Para n�o somar R3 se o aluno n�o passar
	CMP R7,R2@Verifica a quantidade de alunos
	BNE loop@Volta para loop se n�o viu todos alunos
