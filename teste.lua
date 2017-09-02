tabuleiro = require("tabuleiro")



jogadorX = {nome = "", jogada = "X"}
jogadorO = {nome = "", jogada = "O"}

controlador = 2



function novaJogada(jogada, posicao)


	if tabuleiro[posicao] == " " then
	tabuleiro[posicao] = jogada
	else
		print("Posição já jogada ou inválida")
		controlador = controlador + 1

	end

end



function vencedor(tabuleiro)

	--Verifica linha 1
	if tabuleiro[1] == tabuleiro[2] and tabuleiro[2] == tabuleiro[3] and (tabuleiro[3] == "X" or tabuleiro[3] == "O") then

		print("O vencedor foi o jogador: " .. tabuleiro[1])

		return true

	end

	--Verifica linha 2
	if tabuleiro[4] == tabuleiro[5] and tabuleiro[5] == tabuleiro[6] and (tabuleiro[6] == "X" or tabuleiro[6] == "O") then

		print("O vencedor foi o jogador: " .. tabuleiro[4])

		return true

	end

	--Verifica linha 3
	if tabuleiro[7] == tabuleiro[8] and tabuleiro[8] == tabuleiro[9] and (tabuleiro[9] == "X" or tabuleiro[9] == "O") then

		print("O vencedor foi o jogador: " .. tabuleiro[7])

		return true

	end

	--Verifica coluna 1
	if tabuleiro[1] == tabuleiro[4] and tabuleiro[4] == tabuleiro[7] and (tabuleiro[7] == "X" or tabuleiro[7] == "O") then

		print("O vencedor foi o jogador: " .. tabuleiro[1])

		return true

	end

	--Verifica coluna 2
	if tabuleiro[2] == tabuleiro[5] and tabuleiro[5] == tabuleiro[8] and (tabuleiro[8] == "X" or tabuleiro[8] == "O") then

		print("O vencedor foi o jogador: " .. tabuleiro[2])

		return true

	end

	--Verifica coluna 3
	if tabuleiro[3] == tabuleiro[6] and tabuleiro[6] == tabuleiro[9] and (tabuleiro[9] == "X" or tabuleiro[9] == "O") then

		print("O vencedor foi o jogador: " .. tabuleiro[3])

		return true

	end

	--Verifica diagonal 1
	if tabuleiro[1] == tabuleiro[5] and tabuleiro[5] == tabuleiro[9] and (tabuleiro[9] == "X" or tabuleiro[9] == "O") then

		print("O vencedor foi o jogador: " .. tabuleiro[1])

		return true

	end

	--Verifica diagonal 2
	if tabuleiro[3] == tabuleiro[5] and tabuleiro[5] == tabuleiro[7] and (tabuleiro[7] == "X" or tabuleiro[7] == "O") then

		print("O vencedor foi o jogador: " .. tabuleiro[3])

		return true

	end

	cont = 0
	for i = 1, 9 do

		if tabuleiro[i] == " " then
		cont = cont + 1
		end

	end

	if cont == 0 then
		print("Empatou")
	return true

	else
		return false
	end

end



function jogo(tabuleiro)

	print("Jogador O digite seu nome")
	jogadorX.nome = io.read()

	print("Jogador X digite seu nome")
	jogadorO.nome = io.read()

	print("Posições:\n" .. "1 2 3\n4 5 6\n7 8 9")


	venceu = false

	while venceu == false do

		if controlador % 2 == 0 then
			jogadorDaVez = jogadorO.jogada
		else
			jogadorDaVez = jogadorX.jogada
		end

		print("Escolha a posição para jogar: ")
		posicao = io.read("*number")
		jogada = jogadorDaVez

		novaJogada(jogada,posicao)
		visualizarTabuleiro()

		controlador = controlador + 1
	venceu = vencedor(tabuleiro)


	end

end


jogo(tabuleiro)
