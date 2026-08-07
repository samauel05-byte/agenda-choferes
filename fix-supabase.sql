-- Arreglar la tabla reservas para soportar los nuevos estados
-- Ejecuta esto en Supabase SQL Editor

-- 1. Cambiar el tipo de dato de estado_recepcion a text (sin restricciones)
ALTER TABLE reservas
ALTER COLUMN estado_recepcion SET DATA TYPE text;

-- 2. Establecer valor por defecto
ALTER TABLE reservas
ALTER COLUMN estado_recepcion SET DEFAULT 'pendiente';

-- 3. Actualizar valores existentes (opcional)
UPDATE reservas
SET estado_recepcion = 'pendiente'
WHERE estado_recepcion IS NULL OR estado_recepcion = '';

-- 4. Verificar la estructura
SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'reservas' AND column_name = 'estado_recepcion';
