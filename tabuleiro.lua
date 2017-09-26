tabuleiro = {}

function tabuleiro:inicializar()

novoTabuleiro = {}

novoTabuleiro = setmetatable(novoTabuleiro, {__index = tabuleiro})

	for linha = 1, 3 do

		novoTabuleiro[linha] = {}

		for coluna = 1, 3 do

			novoTabuleiro[linha][coluna] = " "

		end

	end

	return novoTabuleiro

end


function tabuleiro:visualizar()

	for linha = 1, 3 do
		aux = ""

		for coluna = 1, 3 do

			if coluna ~= 3 then
				aux = aux .. self[linha][coluna] .. " | "
			else
				aux = aux .. self[linha][coluna]
			end
		end
		print(aux)
		if linha < 3 then
			print("----------")
		end

	end

end

return tabuleiro
