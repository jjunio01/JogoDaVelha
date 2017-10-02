luaunit = require("luaunit")
novoTabuleiro = require("tabuleiro")
novoJogo = require("jogo")
novoJogador = require("jogador")



function testRealizarJogadaValida()

	jogo = novoJogo:novo()
	luaunit.assertEquals(jogo.tabuleiro[2][3] == " ", true)
	jogador = novoJogador:inicializar()
	jogador.jogada = "X"
	testeJogada = jogo:novaJogada(2,3, jogador)
	luaunit.assertEquals(testeJogada, true)
	luaunit.assertEquals(jogo.tabuleiro[2][3] == "X", true)

end

function testRealizarJogadaInvalida()

	local jogo = novoJogo:novo()
	local jogador = novoJogador:inicializar()
	jogador.jogada = "O"
	testeJogada = jogo:novaJogada(4,3, jogador)
	luaunit.assertEquals(testeJogada, false)

end

function testVisualizarTabuleiro()

	local jogo = novoJogo:novo()
	luaunit.assertEquals(jogo.tabuleiro[1][1] == " ", true)
	jogo.tabuleiro:visualizar()

end

function testEmpate()

	local jogo = novoJogo:novo()
	jogo.tabuleiro[1][1] = "X"	jogo.tabuleiro[1][2] = "O"	jogo.tabuleiro[1][3] = "X"
	jogo.tabuleiro[2][1] = "X"	jogo.tabuleiro[2][2] = "X"	jogo.tabuleiro[2][3] = "O"
	jogo.tabuleiro[3][1] = "O" 	jogo.tabuleiro[3][2] = "x"	jogo.tabuleiro[3][3] = "O"
	luaunit.assertEquals(jogo:empate(), true)


end

function testVencedor()

	local jogo = novoJogo:novo()
	jogo.tabuleiro[1][1] = "X"	jogo.tabuleiro[1][2] = "X"	jogo.tabuleiro[1][3] = "X"

	luaunit.assertEquals(jogo:vencedor()[1], true)

end


os.exit( luaunit.LuaUnit.run() )

