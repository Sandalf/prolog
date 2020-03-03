-- Programa que determine si un número es capicua, son números capicua aquellos son los mismos
-- digitos de izquierda a derecha que de derecha a izquierda por ejemplo 1221 es capicua
capicua :: Int -> Bool
capicua n = show n == fmap reverse show n