jogo = {jogador1, jogador2, tabuleiro}


function jogo:novo()

	local novoTabuleiro = require("tabuleiro")
	local novoJogador = require("jogador")

	local novoJogo = {}

	novoJogo = setmetatable(novoJogo, {__index = jogo})

	novoJogo.jogador1 = novoJogador:inicializar()
	novoJogo.jogador2 = novoJogador:inicializar()
	novoJogo.tabuleiro = novoTabuleiro:inicializar()


	return novoJogo

end


function jogo:posicaoValida(linha, coluna)

	if linha >= 1 and linha <= 3 and coluna >= 1 and coluna <=3 then

		if self.tabuleiro[linha][coluna] == " " then

			return true

		end

		print("#### Posição já jogada ####")

		return false

	end

	print("#### Posição inválida ####")

	return false

end


function jogo:novaJogada(linha, coluna, jogador)


	if jogo:posicaoValida(linha, coluna) then

		self.tabuleiro[linha][coluna] = jogador.jogada

		return true

	end

	return false

end


function jogo:empate()

local contador = 10

	for linha = 1, 3 do

		for coluna = 1 , 3 do

			if self.tabuleiro[linha][coluna] ~= " " then

				contador = contador - 1

			end
		end
	end

	if contador == 1 then

		return true

	end

	return false

end



function jogo:vencedor()

--[[local contador = 10

--Verificação de jogo Empatado
	for linha = 1, 3 do

		for coluna = 1 , 3 do

			if self.tabuleiro[linha][coluna] ~= " " then

				contador = contador - 1

			end
		end
	end

	if contador == 1 then

		return true

	end
--]]

	if jogo:empate() then

		return true

	else


	for coluna = 1, 3 do

		if self.tabuleiro[1][coluna] ~= " "  and self.tabuleiro[1][coluna] == self.tabuleiro[2][coluna] and self.tabuleiro[2][coluna] == self.tabuleiro[3][coluna] then

			self.tabuleiro[1][coluna] = "|"
			self.tabuleiro[2][coluna] = "|"
			self.tabuleiro[3][coluna] = "|"
			return true

		end

	end


	for linha = 1, 3 do

		if self.tabuleiro[linha][1] ~= " "  and self.tabuleiro[linha][1] == self.tabuleiro[linha][2] and self.tabuleiro[linha][2] == self.tabuleiro[linha][3] then

			self.tabuleiro[linha][1] = "_"
			self.tabuleiro[linha][2] = "_"
			self.tabuleiro[linha][3] = "_"
			return true

		end

	end

	--Verificação de diagonal
	if self.tabuleiro[1][1] ~= " " and self.tabuleiro[1][1] == self.tabuleiro[2][2] and self.tabuleiro[2][2] == self.tabuleiro[3][3] then

		self.tabuleiro[1][1] = "\\"
		self.tabuleiro[2][2] = "\\"
		self.tabuleiro[3][3] = "\\"
		return true

	end

	--Verificação de diagonal
	if self.tabuleiro[1][3] ~= " " and self.tabuleiro[1][3] == self.tabuleiro[2][2] and self.tabuleiro[2][2] == self.tabuleiro[3][1] then

		self.tabuleiro[1][3] = "/"
		self.tabuleiro[2][2] = "/"
		self.tabuleiro[3][1] = "/"
		return true

	end


	return false


	end

end

return jogo
