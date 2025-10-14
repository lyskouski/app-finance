[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
[Čeština (CS)](./about_cs.md) |
[Nederlandse (NL)](./about_nl.md) |
[English (EN-US)](./about_en.md) |
[Français (FR)](./about_fr.md) |
[Deutsch (DE)](./about_de.md) |
[हिंदी (HI-IN)](./about_hi.md) |
[Italiano (IT)](./about_it.md) |
[日本語 (JA)](./about_ja.md) |
[فارسی (FA)](./about_fa.md) |
[한국어 (KO)](./about_ko.md) |
[Polski (PL)](./about_pl.md) |
[Português Europeu (PT)](./about_pt.md) |
[Português Brasileiro (PTB)](./about_pt_BR.md) |
[Limba română (RO)](./about_ro.md) |
Español (ES) |
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** -- aplicación de contabilidad financiera multiplataforma de código abierto sin anuncios ni limitaciones.
El objetivo de la solución es crear una aplicación de contabilidad financiera que sea intuitiva, eficiente e inclusiva.
Que permita a los usuarios gestionar sus finanzas sin esfuerzo, garantizando al mismo tiempo que nadie se quede atrás.

[![Ver el vídeo](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Funcionalidad
- Contabilidad (tipo de cuenta, divisa/criptodivisa)
  - Agrupación sencilla mediante el símbolo `/` (en el nombre) para la página principal
  - Registro de transacciones
  - Congelar importe por Fecha de actualización (para importar historial anterior)
- Categorías presupuestarias
  - Agrupación simple mediante el símbolo `/` (en el nombre) para la página principal
  - Con actualización de límites:
    - Renovados al principio de cada mes
    - Límites configurables por mes
    - Relativos (0.0 ... 1.0) a los Ingresos
  - O, sin limitaciones mostrando un importe gastado
  - Diferentes cronogramas: semanal, mensual, anual
  - Día de inicio de la semana y del mes personalizable
- Facturas, Transferencias, Ingresos (Facturas)
  - Pagos periódicos (con un widget de inicio)
  - Filtrado
  - Supuesto/predicción de la categoría presupuestaria
- Definición de Metas
- Tipos de cambio, Moneda por defecto para el resumen
- Métricas:
  - Presupuesto:
    - Previsión (con simulación Monte Carlo)
    - Límite presupuestario y gastos por mes
  - Cuenta:
    - Gráfico de velas (OHLC)
    - Radar de salud de ingresos
    - Distribución de divisas
  - Facturas
    - Gastos YTD
    - Carrera de Barras por Categorías
  - Gráfico de Metas
  - Gráfico histórico de divisas
- Sincronización entre dispositivos (P2P)
- Recuperación mediante WebDav o un archivo directo
- Importación desde archivos `CSV`, `QIF`, `OFX` para recibos y facturas
- Exportación a archivo Excel `XLSX`
- Encriptación de datos
- Localización
- Experiencia de usuario
  - Página principal configurable (múltiples configuraciones por conjunto `ancho x alto`)
  - Diseño adaptable y con capacidad de respuesta
    - Panel de navegación adaptable (arriba, abajo, derecha) y pestañas (arriba, izquierda)
  - Modo de tema (oscuro, claro, sistema) con definición de paleta (sistema, personalizado, personal -- selector de colores)
  - Conservar la última opción para Cuenta, Presupuesto y Moneda
  - Desplazamiento automático al elemento seleccionado en el formulario
  - Expandir / contraer secciones en la página principal
  - Deslizar para un acceso rápido a las acciones Editar y Eliminar
  - Ampliar/reducir (del 60% al 200%) a través de «Configuración»
  - Accesos directos

| Descripción                         | Atajo                          |
| ----------------------------------- | ------------------------------ |
| Abrir/Cerrar el cajón de navegación | `Shift` + `Enter`              |
| Navegar hacia arriba                | `arriba`                       |
| Navegar hacia abajo                 | `abajo`                        |
| Abrir seleccionado                  | `Enter`                        |
| Acercar                             | `Ctrl` + `+`                   |
| Acercar (con el ratón)          | `Ctrl` + `desplazarse hacia abajo` |
| Alejar                              | `Ctrl` + `-`                   |
| Alejar (con el ratón)          | `Ctrl` + `desplazarse hacia arriba` |
| Restablecer zoom                    | `Ctrl` + `0`                   |
| Agregar nueva transacción           | `Ctrl` + `N`                   |
| Volver atrás                        | `Ctrl` + `Backspace`           |
<!--
| Editar elemento seleccionado        | `Ctrl` + `E`                   |
| Eliminar elemento seleccionado      | `Ctrl` + `D`                   |
-->
