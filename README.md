# Programador de Logística de Equipos Pesados — Porto Valencia

Sistema de agenda y control logístico para la asignación de equipos pesados (excavadoras, telehandlers, minicargadores, camiones, etc.) entre los distintos proyectos de **Constructora Dupla / Grupo Dupla**, desarrollado para **Porto Valencia**.

🔗 **App en producción:** https://programador-logistico-pv.vercel.app

## ¿Qué hace?

- Programa y agenda la asignación de equipos pesados a proyectos y áreas específicas, respetando el horario laboral (lunes a sábado 8:00am–6:00pm, domingo 8:00am–3:00pm) y la hora de almuerzo (12:00–1:00pm), todo anclado a la hora real de República Dominicana.
- Sigue el ciclo de vida completo de cada asignación: pendiente → llegada → labor en progreso → pausada (con motivo) → terminada → equipo liberado, incluyendo marcado automático de "No Llegó" cuando corresponde.
- Tablero en tiempo real del estado de cada equipo (disponible, en uso, pendiente de llegada, fuera de servicio) con actualización automática vía Supabase Realtime.
- Reportería y exportación a CSV para administración.
- Modo administrador protegido por código maestro (verificado en el servidor, con límite de intentos fallidos) para editar/eliminar asignaciones, mover equipos entre proyectos, agregar equipos nuevos y marcar equipos fuera de servicio.
- Envío del resumen de cada asignación por WhatsApp al coordinador.

## Stack técnico

- **Frontend:** aplicación de una sola página (`index.html`), HTML/CSS/JS puro sin build step.
- **Backend:** [Supabase](https://supabase.com) (Postgres + PostgREST + Realtime), con funciones `SECURITY DEFINER` para las acciones administrativas.
- **Hosting:** [Vercel](https://vercel.com) (producción, despliegue automático desde `main`); Netlify se usa solo para previews de pull requests.
- **CI:** GitHub Actions incrementa automáticamente el número de versión (pie de página) en cada push a `main`.

## Desarrollo

No requiere build ni instalación de dependencias: es un único archivo `index.html` servido de forma estática. Las credenciales de Supabase (URL y clave pública `anon`) están embebidas en el cliente; toda acción sensible (crear/editar/eliminar, modo administrador) pasa por funciones de Postgres protegidas en el servidor, nunca por lógica confiable solo en el cliente.

Para levantar el proyecto localmente basta con servir `index.html` con cualquier servidor estático, por ejemplo:

```bash
python3 -m http.server 8080
```

## Licencia

Proyecto privado de uso interno para Constructora Dupla / Grupo Dupla / Porto Valencia.
