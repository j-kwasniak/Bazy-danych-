
CREATE PROCEDURE fibb (@n int = 12) 
	AS 
	DECLARE 
	@i int = 2, 
	@obecna int = 1, 
	@poprzednia int = 0;
	
	CREATE TABLE tabela(fibonacci_values int);
	INSERT INTO tabela values (@poprzednia);
	if @n>1
	begin
	insert into tabela values(@obecna);
	while @i<@n 
		BEGIN
		SET @obecna = @obecna + @poprzednia;
		SET @poprzednia = @obecna - @poprzednia;
		SET @i = @i + 1;
		INSERT INTO tabela values (@obecna);
	end
end

SELECT * from tabela;

exec fibb;