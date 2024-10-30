# Multiplicador de 4 Bits - Taller de Arquitectura 2024

## Descripción del Proyecto
Este proyecto consiste en la implementación de un **multiplicador para dos números binarios sin signo de 4 bits**. Se utilizó un diseño basado en componentes ya desarrollados en los trabajos prácticos anteriores (2 a 8) y se modeló el comportamiento del multiplicador a partir de una **máquina de estados finita (FSM)** que controla el proceso de multiplicación.

El desarrollo incluye:
1. **Diseño del Multiplicador de 4 bits** a partir de componentes previamente creados.
2. **Desarrollo de un testbench** para validar el correcto funcionamiento del multiplicador.

## Estructura del Proyecto
- **multiplicador.vhd**: Implementa la entidad del multiplicador de 4 bits, el cual se basa en una FSM para controlar el proceso de multiplicación, desplazamiento y suma.
- **test_multiplicador.vhd**: Incluye el testbench para probar la entidad del multiplicador. Utiliza los dígitos de mayor y menor valor de un número de legajo como entradas para las pruebas.

## Componentes y Control
El multiplicador está compuesto por los siguientes componentes:
- **Registros de desplazamiento** para almacenar y manipular los operandos durante el proceso de multiplicación.
- **Sumador** para acumular los resultados parciales.
- **FSM (Máquina de Estados Finita)** para controlar el flujo de operación. La FSM tiene los estados **Init, Check, Add, Shift, End**, que permiten inicializar, sumar y desplazar los valores de manera iterativa hasta obtener el resultado.


![Diagrama del multiplicador](https://github.com/user-attachments/assets/885bd426-1caa-4242-b896-d25576d86d47)


## Archivos Entregados
- **Informe en Word**: Se incluye un informe que describe los resultados de la simulación y responde las preguntas planteadas en la práctica.
- **Código VHDL**: Se enviaron los archivos `.vhd` correspondientes al **multiplicador** y al **testbench** para su compilación y simulación.

## Instrucciones para la Compilación y Simulación
1. **Compilar** los archivos `multiplicador.vhd` y `test_multiplicador.vhd` en el entorno de desarrollo de VHDL de tu preferencia.
2. **Ejecutar la simulación** utilizando el testbench para validar el correcto funcionamiento.
3. **Observar las señales** de salida (Result, Done) y las señales de depuración (opcional) en el waveform para validar la operación.

## Nota Final
Este trabajo práctico fue desarrollado como parte del curso de **Taller de Arquitectura 2024** y tiene como objetivo reforzar los conocimientos sobre **máquinas de estados finitas** y el uso de componentes reutilizables en el diseño de hardware.

