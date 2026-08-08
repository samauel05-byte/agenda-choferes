-- Agrega la columna "aprobado" a la tabla reservas para el Panel de Administración
-- Ejecuta esto en Supabase SQL Editor

ALTER TABLE reservas
ADD COLUMN IF NOT EXISTS aprobado boolean NOT NULL DEFAULT false;
