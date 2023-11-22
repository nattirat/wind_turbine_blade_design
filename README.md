# Wind Turbine Blade Design Research Project
This research is a part of my work as a research assistant at the Department of Aeronautics and Astronautics, National Cheng Kung University (NCKU), in Taiwan. 

Please find more detail information inside **Report-WindTBlade-VF.pdf** and **Presentation-ReseachProject.pdf**

# Introduction
Environment concerns have driven us to promote and encourage the use of renewable energy. Wind energy has become one of the mainstream sources of alternatives to conventional energy generation. 

To maximize the optimum efficiency, wind energy researchers around the globe work with great efforts to optimize the design of the wind turbine blades that generate maximum energy output. 

The aim of this project is to design and optimize a 1-meter in length of the wind turbine blade using MATLAB (for mathematical calculations) and SolidWorks (for blade simulation). Blade Element Momentum (BEM) Theory is applied throughout this project. 

# Methodology
Phase 1: Preliminarily Research 

Constructing the understanding of wind turbine components, design principles, as well as aerodynamics are essential to perform this project. The textbooks Wind Energy Explained by J.F. Manwell, J.G. McGowan, and A.L. Rogers, and Wind Energy Handbook by Tony Burton, David Sharpe, Nick Jenkins, and Ervin Bossanyi are the main references to this research project. 

Phase 2: Blade Element Momentum (BEM) Theory with MATLAB

BEM refers to the theory which relates the blade shape to the ability of the rotor to generate the power from the wind (wind turbine performance). This theory combines the momentum and blade element theory equation together.

Assumptions
- Each blade element has no aerodynamic interaction to each other
- The force on the blades is a function of lift and drag only

BEM is translated to MATLAB code which is written with the following constraints:  
- Horizontal Axis Wind Turbine (HAWT)
- Small wind turbine with 3 blades
- 1250 W power input
- 5 degree of initial angle of attack
- Tip speed ratio (λ) of 6
- RPM from 0 to 900
- Wind speed from 3 to 12 m/s

Phase 3: Turbine Blade Simulation with SolidWorks 

After obtaining the calculations from MATLAB. The blade prototype is simulated using SolidWorks as shown below: 

![BladeTopView](https://github.com/nattirat/wind_turbine_blade_design/assets/144031651/ca9637d1-87b9-4199-9d44-a316030bd543)

![BladeLeftView](https://github.com/nattirat/wind_turbine_blade_design/assets/144031651/86e89a87-e36c-4d1e-8ccd-0737d3208ecc)

![BladeIsometricView](https://github.com/nattirat/wind_turbine_blade_design/assets/144031651/13bda051-0a60-4479-8207-abc173c9ccd8)

![BladeFrontView](https://github.com/nattirat/wind_turbine_blade_design/assets/144031651/07783d43-dbe0-442a-b0dc-5f879e48e2c7)

# Recommendations
In the process of designing the blade, the optimization for blade parameters should be involved in the design in order to get a best character of blade. The blade designed from this MATLAB code has high different chord length and twist angle between 1st and 2nd blade section; therefore, this should be optimized for more logical value in the real application. 
Moreover, the airfoil used in this wind turbine blade is uniform along the element. In fact, each blade element consists of different chord length; as a consequence, there are different values of Reynolds numbers. Each airfoil can operate at its optimum performance in different range of Reynolds number; therefore, the use of different airfoil sections can generate different value of lift to drag ratio and this can increase the value of power coefficient for the whole blade. 

# Conclusion
The code from MATLAB in this project can be use solely for simplest optimal design because, in practical, there are some factors that are needed to concern such as different flow regime over the blade. Furthermore, for an optimal design blade, the wind tunnel test needs to be involved.    


