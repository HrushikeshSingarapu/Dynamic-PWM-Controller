# Dynamic-PWM-Controller


This project implements a **parameterized and dynamically configurable PWM (Pulse Width Modulation) controller** in Verilog. The design allows **runtime updates of duty cycle and frequency** while ensuring **glitch-free transitions** using a shadow register mechanism.

---

## 🎯 Project Objective

To design a hardware-efficient PWM generator that supports **safe dynamic reconfiguration** without producing glitches during parameter updates. This is useful in motor control, power electronics, and digital control systems.

---

## 🧠 Architecture Overview

The design is divided into three modular RTL blocks:

### 1️⃣ PWM Core
Generates the PWM signal using a counter and comparator.

- Parameterized counter width  
- Duty cycle vs period comparison  
- Rollover signal for synchronization  

### 2️⃣ Register Manager
Handles **glitch-free parameter updates**.

- Uses shadow registers for new values  
- Commits updates only at PWM counter rollover  
- Ensures duty cycle ≤ period condition  

### 3️⃣ Top Module
Integrates PWM core and register manager to form a complete dynamic PWM system.

---

## ⚙️ Key Features

✔ Parameterized PWM resolution  
✔ Runtime duty cycle adjustment  
✔ Runtime frequency adjustment  
✔ Glitch-free update mechanism  
✔ Modular RTL structure  
✔ Simulation-based verification  

---

## 🧪 Verification

Two testbenches validate the design:

### 🔹 tb_pwm_core
Verifies PWM waveform generation for fixed parameters.

### 🔹 tb_top
Tests dynamic reconfiguration:
- Duty cycle update (25% → 75%)
- Frequency change during operation
- Proper synchronization at rollover boundaries

Simulation confirms correct PWM behavior without output glitches.

---

## 📁 Repository Structure

