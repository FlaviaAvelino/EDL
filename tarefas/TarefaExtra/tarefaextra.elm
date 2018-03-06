import Html exposing (text)

-- Considere uma turma de 50 alunos.
-- Cada aluno possui duas notas.
-- O aluno que ficou com m�dia maior ou igual a sete � considerado aprovado.

-- Considere as seguintes defini��es em Elm para os tipos Aluno e Turma:

type alias Aluno = (String, Float, Float) -- Aluno � um tipo tupla com o nome e as duas notas
type alias Turma = List Aluno             -- Turma � um tipo lista de alunos

-- O nome ou a m�dia de um aluno pode ser obtido atrav�s das seguintes fun��es:

media: Aluno -> Float
media (_,n1,n2) = (n1+n2)/2     -- o nome � ignorado

mediaAp: Aluno -> Bool
mediaAp (_,n1,n2) = (((n1+n2)/2) >= 7)

notadez: Aluno -> Bool
notadez (_,n1,_) = (n1 == 10)


nome: Aluno -> String
nome (nm,_,_) = nm              -- as notas s�o ignoradas


alunoMed: Aluno -> (String,Float)
alunoMed  (nm, n1, n2) = (nm, (n1+n2)/2) 

notasn1n2: Aluno -> List Float -> List Float
notasn1n2 (_,n1,n2) n = n ++ [n1] ++ [n2]




-- Por fim, considere as assinaturas para as fun��es map, filter, e fold a seguir:

--List.map: (a->b) -> (List a) -> (List b)
  -- mapeia uma lista de a's para uma lista de b's com uma fun��o de a para b

--List.filter: (a->Bool) -> (List a) -> (List a)
  -- filtra uma lista de a's para uma nova lista de a's com uma fun��o de a para Bool

--List.foldl : (a->b->b) -> b -> List a -> b
  -- reduz uma lista de a's para um valor do tipo b
        -- usa um valor inicial do tipo b
        -- usa uma fun��o de acumulacao que
            -- recebe um elemento da lista de a
            -- recebe o atual valor acumulado
            -- retorna um novo valor acumulado

-- Usando as defini��es acima, forne�a a implementa��o para os tr�s trechos marcados com <...>:

turma: Turma
turma = [ ("Joao",7,4), ("Mariah Carey ",10,8), ("Whitney Houston",10,10), ("Michael Jackson",10,10), ("John Lennon",7,4), ("Britney Spears",2,4), ("Freddie Mercury",9,7), ("Beyonce",5,5), ("Renato Russo",7,7),("David Bowie",8,8), ("Pabllo Vittar",0,0), ("Stevie Wonder",10,10), ("Aretha Franklin",9,9)] 

-- a) LISTA COM AS M�DIAS DOS ALUNOS DE "turma" ([5.5, 9, ...])

medias: List Float
medias = List.map media turma

-- b) LISTA COM OS NOMES DOS ALUNOS DE "turma" APROVADOS (["Maria", ...])

medias_Aprovados = List.filter mediaAp turma

aprovados: List String
aprovados = List.map nome medias_Aprovados

-- c) M�DIA FINAL DOS ALUNOS DE "turma" (m�dia de todas as m�dias)

soma: Float -> Float -> Float
soma x y = (x + y)
mediaFinal = List.foldl soma 0 medias

total = mediaFinal / 13  --13 foi o n�mero de alunos que eu inseri na lista

-- d) LISTA DE ALUNOS QUE GABARITARAM A P1 ([("Maria",10,8), ...])

turma_dez_p1: Turma
turma_dez_p1 = List.filter notadez turma

-- e) LISTA COM OS NOMES E MEDIAS DOS ALUNOS APROVADOS ([("Maria",9), ...])

aprovados2: List (String,Float)
aprovados2 = List.map alunoMed medias_Aprovados

-- f) LISTA COM TODAS AS NOTAS DE TODAS AS PROVAS ([7,4,10,8,...])

notas: List Float
notas = List.foldl notasn1n2[] turma

--main = text (toString medias)
main = text (toString aprovados)
--main = text (toString total)
--main = text (toString turma_dez_p1)
--main = text (toString aprovados2)
--main = text (toString notas)