# Optimization of Cylinder Geometry Using Genetic Algorithms in MATLAB

# 1. Introduction

This project presents a numerical study on the application of Genetic Algorithms (GA) for both single-objective and multi-objective optimization problems using MATLAB.

The study considers a classical geometric optimization problem: determining the cylinder dimensions that minimize surface area for a prescribed constant volume. The problem is solved using:

Single-objective Genetic Algorithm (ga)

Multi-objective Genetic Algorithm (gamultiobj)

The purpose of this work is to analyze the behavior of evolutionary optimization methods and compare their performance in constrained and multi-objective formulations.

# 2. Problem Definition

Design Variable:  
  - Input parameter  - Height (h), Diameter (d)
  - Output Parameter - Surface area (minimum), Voume (constant = 100 ml)

Objective:  Minimum surface area @ constant Volume condition

# 3. Approach

# 3.1 Single-Objective Optimization (ga)

- Objective: Minimize surface area 
- Constraint: Fixed volume
- An initial guess is provided
- Linear/nonlinear constraint formulation used

Uses MATLAB’s ga function

- Produces one optimal solution-
- Verifies analytical result (optimal when d = h)

# 3.2 Multi-Objective Optimization (gamultiobj)

- Objective 1: Minimize surface area
- Objective 2: Maintain volume (or minimize volume deviation)
- No initial guess provided

Uses MATLAB’s gamultiobj function

- Produces a Pareto front
- Shows trade-off between geometry parameters
- Visualizes Pareto front and Pareto set
