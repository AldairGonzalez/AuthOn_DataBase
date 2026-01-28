Este repositorio contiene la definición de la infraestructura de datos para el ecosistema AuthOn. Diseñada para soportar operaciones críticas de autenticación con milisegundos de latencia.

El diseño prioriza la seguridad y la integridad referencial, delegando la lógica de manipulación de datos masiva al motor de base de datos para reducir la carga en la API.

Puntos Destacados:

🚀 Optimización: Uso extensivo de Índices y NOCOUNT para minimizar el tráfico de red.

🔒 Seguridad: Lógica encapsulada en Stored Procedures para prevenir SQL Injection y controlar la superficie de ataque.

📦 Integridad: Restricciones (Constraints), Llaves Foráneas y manejo de concurrencia a nivel de base de datos.

🔄 Lógica de Negocio en BD: Validaciones críticas (como ISNULL o conteo de intentos) manejadas nativamente para evitar errores de aplicación.

Tecnologías: Microsoft SQL Server, T-SQL, SSDT (SQL Server Data Tools).
