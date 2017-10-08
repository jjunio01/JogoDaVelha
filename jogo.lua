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

	if self:valoresValidos(linha, coluna) then

		if self.tabuleiro[linha][coluna] == " " then

			return {true}

		else

			return {false,1}

		end
	else
		return {false}
	end
end


function jogo:novaJogada(linha, coluna, jogador)


	if self:posicaoValida(linha, coluna)[1] then

		self.tabuleiro[linha][coluna] = jogador.jogada

		return {true}
	end

	return self:posicaoValida(linha, coluna)

end


function jogo:tabuleiroPreenchido()

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


function jogo:valoresValidos(linha, coluna)

	if linha == 1 or linha == 2 or linha == 3 then

		if coluna == 1 or coluna == 2 or coluna == 3 then

			return true

		end

		return false
	end

	return false
end


function jogo:termino()


	--Verificar vencedor nas colunas
	for coluna = 1, 3 do

		if self.tabuleiro[1][coluna] ~= " "  and self.tabuleiro[1][coluna] == self.tabuleiro[2][coluna] and self.tabuleiro[2][coluna] == self.tabuleiro[3][coluna] then

			self.tabuleiro[1][coluna] = "|"
			self.tabuleiro[2][coluna] = "|"
			self.tabuleiro[3][coluna] = "|"
			return {true, 1}

		end

	end

	--Verificar vencedor nas linhas
	for linha = 1, 3 do

		if self.tabuleiro[linha][1] ~= " "  and self.tabuleiro[linha][1] == self.tabuleiro[linha][2] and self.tabuleiro[linha][2] == self.tabuleiro[linha][3] then

			self.tabuleiro[linha][1] = "-"
			self.tabuleiro[linha][2] = "-"
			self.tabuleiro[linha][3] = "-"
			return {true, 1}

		end

	end

	--Verificar vencedor na diagonal principal da matriz
	if self.tabuleiro[1][1] ~= " " and self.tabuleiro[1][1] == self.tabuleiro[2][2] and self.tabuleiro[2][2] == self.tabuleiro[3][3] then

		self.tabuleiro[1][1] = "\\"
		self.tabuleiro[2][2] = "\\"
		self.tabuleiro[3][3] = "\\"
		return {true, 1}

	end

	--Verificar vencedor na diagonal secundária da matriz
	if self.tabuleiro[1][3] ~= " " and self.tabuleiro[1][3] == self.tabuleiro[2][2] and self.tabuleiro[2][2] == self.tabuleiro[3][1] then

		self.tabuleiro[1][3] = "/"
		self.tabuleiro[2][2] = "/"
		self.tabuleiro[3][1] = "/"
		return {true, 1}

	end

	if jogo:tabuleiroPreenchido() then

		return {true, 2}

	else

	return {false}

	end

end

return jogo

