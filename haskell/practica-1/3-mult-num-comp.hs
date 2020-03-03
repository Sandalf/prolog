-- Programa que calcule el Producto de dos numeros complejos
multNumComp :: (Int, Int) -> (Int, Int) -> (Int, Int)

multNumComp (a, b) (c, d) = ((a * c) - (b * d), (a * d) + (b * c))
