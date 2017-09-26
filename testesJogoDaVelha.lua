luaunit = require("luaunit")
novoTabuleiro = require("tabuleiro")
novoJogo = require("jogo")
novoJogador = require("jogador")
jogo = novoJogo:novo()


function testRealizarJogadaValida()

	luaunit.assertEquals(jogo.tabuleiro[2][3] == " ", true)
	jogador = novoJogador:inicializar()
	jogador.jogada = "X"
	testeJogada = jogo:novaJogada(2,3, jogador)
	luaunit.assertEquals(testeJogada, true)
	luaunit.assertEquals(jogo.tabuleiro[2][3] == "X", true)


end

function testRealizarJogadaInvalida()

	jogador = novoJogador:inicializar()
	jogador.jogada = "X"
	testeJogada = jogo:novaJogada(4,3, jogador)


	luaunit.assertEquals(testeJogada, false)

end

os.exit( luaunit.LuaUnit.run() )

