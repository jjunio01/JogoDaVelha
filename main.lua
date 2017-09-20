jogoDaVelha = require("jogo")

jogo = jogoDaVelha:novo()

jogo.jogador1.jogada = "O"
jogo.jogador2.jogada = "X"

controlador = 2


function jogoDaVelha()

	print("Bem Vindo ao Jogo da Velha")
	print("===========================")

	venceu = false

	while venceu == false do

		if controlador %2 == 0 then

			jogadorDaVez = jogo.jogador1

		else

			jogadorDaVez = jogo.jogador2
		end

		print("Escolha a posição de sua jogada:")
		print("Escolha a linha: ")
		print("===========================")
		linha = io.read("*number")
		print("Escolha a coluna: ")
		coluna = io.read("*number")

		jogada = jogo:novaJogada(linha, coluna, jogadorDaVez)

			if jogada == false then
				controlador = controlador + 1
			else
				jogo.tabuleiro:visualizar()
			end

		controlador = controlador + 1

		venceu = jogo:vencedor()

	end

end

jogoDaVelha()


