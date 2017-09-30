jogoDaVelha = require("jogo")

jogo = jogoDaVelha:novo()

jogo.jogador1.jogada = "O"
jogo.jogador2.jogada = "X"

local controlador = 2


function jogoDaVelha()

	print("Bem Vindo ao Jogo da Velha")
	print("--------------------------")
	print("Jogador 'O' escreva seu nome: ")
	jogo.jogador1.nome = io.read()
	print("Jogador 'X' escreva seu nome: ")
	jogo.jogador2.nome = io.read()

	local termino = false

	while termino == false do

		if controlador %2 == 0 then

			jogadorDaVez = jogo.jogador1

		else

			jogadorDaVez = jogo.jogador2

		end

		print()
		print("===========================")
		print("Jogador " .. "'" .. jogadorDaVez.jogada .. "'")
		print("Escolha a posição de sua jogada:")
		print("Escolha a linha: ")
		local linha = io.read()
		print("Escolha a coluna: ")
		local coluna = io.read()
		coluna = tonumber(coluna)
		linha = tonumber(linha)

		jogada = jogo:novaJogada(linha, coluna, jogadorDaVez)

		if jogada == false then

			controlador = controlador + 1

		else

			jogo.tabuleiro:visualizar()

		end

		controlador = controlador + 1

		termino = jogo:vencedor()

	end

	if termino[2] == 1 then
		print("Jogador " .. "'" .. jogadorDaVez.jogada .. "'" .. " venceu.")
		print("=== PARABÉNS ".. jogadorDaVez.nome .. " =====")
		jogo.tabuleiro:visualizar()

	end

	if termino[2] == 2 then

		print("=== Jogo Empatado  ===")

	end



end

jogoDaVelha()


