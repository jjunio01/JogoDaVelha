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
		local mostraTabuleiro = true
		if mostraTabuleiro then
			jogo.tabuleiro:visualizar()
			mostraTabuleiro = false
		end
		print("Escolha a linha: ")
		local linha = io.read()
		print("Escolha a coluna: ")
		local coluna = io.read()
		coluna = tonumber(coluna)
		linha = tonumber(linha)

		if jogo:valoresValidos(linha, coluna) then

			local controleJogada = jogo:novaJogada(linha, coluna, jogadorDaVez)

			jogada = controleJogada[1]

			if controleJogada[2] == 1 then
				print("#### Posição já jogada####")
			end

		else
			print("=== POSIÇÃO INVÁILIDA ===\nDigite Valores entre 1 e 3")
			jogada = false

		end

		if jogada == false then

			controlador = controlador + 1

		else

			jogo.tabuleiro:visualizar()

		end

		controlador = controlador + 1

		local partida = jogo:termino()

		if partida[2] == 1 then
			print("Jogador " .. "'" .. jogadorDaVez.jogada .. "'" .. " venceu.\n")
			print("=== PARABÉNS ".. jogadorDaVez.nome .. " =====\n")
			jogadorDaVez.pontos = jogadorDaVez.pontos + 1
			print("=== " .. jogo.jogador1.nome .. " possue " .. jogo.jogador1.pontos .. " vitórias =====\n")
			print("=== " .. jogo.jogador2.nome .. " possue " .. jogo.jogador2.pontos .. " vitórias =====\n")
			jogo.tabuleiro:visualizar()

		end

		if partida[2] == 2 then

			print("=== Jogo Terminou em Empate!  ===")
			print("=== " .. jogo.jogador1.nome .. " possue " .. jogador1.pontos .. " vitórias =====\n")
			print("=== " .. jogo.jogador2.nome .. " possue " .. jogador2.pontos .. " vitórias =====\n")

		end

		if partida[1] then

			local continuar = true

			while continuar do
				print("=== DESEJAM CONTINUAR? ===\n1- Sim\n2- Não")
				local continuarJogo = io.read()
				continuarJogo = tonumber(continuarJogo)

				if continuarJogo == 1 then
					jogo.tabuleiro:zerar()
					continuar = false
					jogadorDaVez = jogo.jogador1
				end

				if continuarJogo == 2 then

					termino = true
					continuar = false

				end
			end
		end
	end
end

jogoDaVelha()


