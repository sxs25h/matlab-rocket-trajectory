MATLAB Rocket Trajectory Simulation

Overview

This project simulates the vertical flight of a rocket using MATLAB. It models powered ascent and coasting until the rocket reaches apogee (maximum altitude).

Engineering Concepts

Numerical integration using MATLAB's ode45 solver

Variable mass during powered flight

Gravitational acceleration

Altitude-dependent atmospheric density

Aerodynamic drag

Event-based apogee detection

Comparison of simulated flight performance under different conditions

Project Files

rocket_trajectory.m — Main simulation, results, and plots

rocketODE.m — Equations of motion

apogeeEvent.m — Detects apogee and terminates integration

Rocketexperimentcomparison.m — Compares maximum altitudes across experiments

Tools

MATLAB

MATLAB Onramp

Model Limitations

This is an educational, simplified vertical-flight model. It assumes constant thrust during powered flight and uses a simplified atmospheric density model. It does not include wind, steering, or a validated real-world rocket model.

How to Run

Download all four MATLAB files.

Place them in the same folder.

Open MATLAB and set that folder as the current folder.

Run rocket_trajectory.m to simulate the flight and generate the plots.

Run Rocketexperimentcomparison.m to display the experiment comparison.

Future Improvements

Automate experiment comparisons by running simulations with different parameters.

Add more detailed performance analysis.

Compare simulation outputs under additional model assumptions.
