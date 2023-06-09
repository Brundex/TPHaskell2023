-- Completar con los datos del grupo
--
-- Nombre de Grupo: xx
-- Integrante 1: Nombre Apellido, email, LU
-- Integrante 2: Nombre Apellido, email, LU
-- Integrante 3: Nombre Apellido, email, LU
-- Integrante 4: Nombre Apellido, email, LU

type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- Ejercicios

nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios = undefined

-- describir qué hace la función: .....
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe = undefined

-- describir qué hace la función: .....
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos = undefined

-- describir qué hace la función: .....
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos = undefined

-- describir qué hace la función: .....
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos = undefined

-- describir qué hace la función: .....
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe = undefined

-- describir qué hace la función: .....
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA = undefined

-- describir qué hace la función: .....
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones = undefined

-- describir qué hace la función: .....
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel = undefined

-- describir qué hace la función: .....
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos = undefined








------------
pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False -- Si la lista está vacía, entonces el elemento no pertenece
pertenece x (y:ys) 
  | x == y    = True -- Si el elemento actual es igual a la cadena dada, entonces el elemento pertenece
  | otherwise = pertenece x ys -- En caso contrario, seguimos buscando en la lista
-- TESTS:
-- usuario1 ["usuario1", "usuario2"]
-- "usuario1" ["usuario1", "usuario2"]
-- 1 [1, 2]
-- True [False, False, True]
-- pertenece (1,2) [(1,2),(1,1)]
-- pertenece (2,1) [(1,2),(1,1)]

mismosElementos :: Eq a => [a] -> [a] -> Bool
mismosElementos [] []     = True  -- Las listas vacías tienen los mismos elementos
mismosElementos [] _      = False -- Si la primera lista está vacía, no tienen los mismos elementos
mismosElementos (x:xs) ys = pertenece x ys && mismosElementos xs ys
-- Si la primera lista no está vacía, verificamos si el primer elemento está en la segunda lista y continuamos verificando con el resto de la lista
-- Utilizamos la función pertenece para verificar si el primer elemento está en la segunda lista
-- Continuamos llamando recursivamente la función con el resto de la primera lista y la segunda lista