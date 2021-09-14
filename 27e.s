@Código que conta a quantidade de alunos aprovados em uma determinada
disciplina (media maior ou igual a 60 e frequência maior ou igual a 75). As
médias estão armazenadas em valores de 8 bits em memória a partir do
endereço indicado por R0, e as frequências estão armazenadas em valores de 8
bits em memória a partir do endereço indicado por R1. A quantidade total de
alunos está armazenada em R2, e o resultado calculado da quantidade de alunos
aprovados deve ser armazenada em R3.


loop:	
	SUB R7,#1@R7--
	AND R0,R1@Verifica se o aluno teve frequencia e media
	BZ loop@Para não somar R3 se o aluno não passar
	CMP R7,R2@Verifica a quantidade de alunos
	BNE loop@Volta para loop se não viu todos alunos
