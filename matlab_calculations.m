clc
clear all
close all

              %% Defined parameter             
              
        P = 1250; % Power (W) :Defined
        Density = 1.225; % kg/m^3
        U = 12.5; % Wind velocity (m/s)
        Cl_i = 1; % Ideal lift coefficient
        Cd_i = 0.03; % Ideal drag coefficient
        TSR = 6; % Tip speed ratio of the entire blade
        Vs = input('Wind speed (m/s) : '); % Freestream velocity 
        
        
                                                     
              %% Initial setting parameters      
        format long
        AOA = 5; % Angle of attack (deg)
        Cp = 0.33; % Power coefficient for blade :Assumed
        B = 3; % Number of blade
        R = sqrt(P/(0.5*Density*(U^3)*pi*Cp)); % Efficient radius (m)
        R_tip = 0.9; % (m)
        R_root = 0; % (m)
        R_hub = 0.09; %(m)
        
        % Naca 1014
        %cla = [-20 -18 -16 -14 -12 -10 -8 -6 -4 -2 0 2 4 6 8 10 12 14 16 18 20 30 40 50 60 70 80 90]; % attack angle
        %clf = [-1.524 -1.298 -1.07 -0.839 -0.606 -0.371 -0.134 0.103 0.341 0.571 0.699 0.797 0.868 0.912 0.928 0.918 0.879 0.81 0.708 0.694 0.678 0.678 0.678 0.678 0.678 0.678 0.678 0.678]; % cl coefficient
        %cdf = [0.052 0.0415 0.0294 0.0239 0.0187 0.0145 0.0119 0.0106 0.0103 0.0108 0.0106 0.0109 0.014 0.017 0.0208 0.0256 0.0329 0.0411 0.0511 0.0629 0.0528 0.0528 0.0528 0.0528 0.0528 0.0528 0.0528 0.0528];

        cla = [-20 -19 -18	-17	-16	-15	-14	-13	-12	-11	-10	-9	-8	-7	-6	-5 -4 -3	-2	-1	0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30	31	32	33	34	35	36	37	38	39	40	41	42	43	44	45	46	47	48	49	50	51	52	53	54	55	56	57	58	59	60	61	62	63	64	65	66	67	68	69	70	71	72	73	74	75	76	77	78	79	80	81	82	83	84	85	86	87	88	89	90];
        clf = [-0.995	-1.026	-1.05	-1.058	-1.052	-1.037	-1.012	-0.977	-0.933	-0.878	-0.815	-0.743	-0.665	-0.582	-0.604	-0.491	-0.373	-0.254	-0.132	-0.01	0.112	0.234	0.356	0.476	0.595	0.712	0.825	0.932	1.023	1.085	1.124	1.156	1.2	1.229	1.256	1.276	1.282	1.276	1.263	1.24	1.209	1.17	1.129	1.083	1.035	0.986	0.937	0.888	0.841	0.796	0.752	0.711	0.672	0.636	0.601	0.569	0.539	0.511	0.485	0.461	0.439	0.418	0.396	0.374	0.355	0.337	0.32	0.305	0.29	0.277	0.265	0.253	0.243	0.233	0.224	0.215	0.207	0.2	0.193	0.187	0.181	0.175	0.17	0.165	0.16	0.156	0.152	0.148	0.145	0.142	0.139	0.136	0.133	0.131	0.128	0.126	0.124	0.123	0.121	0.119	0.118	0.117	0.115	0.114	0.113	0.113	0.112	0.111	0.111	0.11	0.11];
        cdf = [0.24309	0.21756	0.19407	0.17521	0.15493	0.13748	0.12394	0.10941	0.09609	0.08503	0.07473	0.06619	0.05876	0.05184	0.01996	0.01886	0.01519	0.01711	0.01662	0.01632	0.01642	0.01672	0.01734	0.01568	0.02015	0.02117	0.02247	0.02414	0.02677	0.03315	0.04601	0.06407	0.07928	0.09658	0.11226	0.12863	0.14693	0.16516	0.18456	0.20509	0.22897	0.25159	0.28195	0.31023	0.33588	0.37672	0.40662	0.44247	0.47834	0.52363	0.56434	0.61964	0.65847	0.71659	0.75716	0.8168	0.90276	0.93777	0.99492	1.09367	1.10333	1.17569	1.2897	1.39055	1.45956	1.52692	1.58156	1.60377	1.80767	1.87087	1.94008	2.01519	2.09758	2.19022	2.30146	2.42801	2.52088	2.62019	2.72678	2.84609	2.90476	3.04221	3.19932	3.10502	3.31501	3.27036	3.43354	3.61613	3.60457	3.82219	3.73971	4.02847	4.03665	3.96525	4.22588	4.20179	4.17597	4.54428	3.59633	3.49519	4.40395	3.44383	3.70535	3.75529	3.63308	3.55113	3.57938	3.84484	3.7541	3.6465	3.64974];

                
      %% Blade Shape for ideal rotor without wake
      % Assumption
        % There is no wake rotation, a' = 0
        % There is no drag, Cd = 0
        % There is no losses from blades
        % For the Betz optimum rotor, a = 1/3  
i = 0; k =0;
for W = 0:100:900 % an angular velocity (rpm)
    w = W*(pi/30);
    k = k+1;
% The length of blade is subdivided into 10 sections
  for r = R_hub:(R_tip-R_root)/10:R_tip
     i = i+1;
    TSRr(i) = (r/R_tip)*TSR; 
    Phi_rad(i) = atan(2/(3*TSRr(i))); % Phi is an angle of relaive wind
    Phi_deg(i) = Phi_rad(i)*(180/pi);
    Pitch_angle(i) = Phi_deg(i)-AOA;
    c(i) = (8*pi*r*sin(Phi_rad(i)))/(3*B*Cl_i*TSRr(i));    
    %calU(i) = sqrt((r*w)^2*(1+a_dash)^2+(2/3*Vs)^2);    
    
    
       %% Performance prediction with wake rotation
           % The analysis includes wake rotation, drag, losses
    % find solidity for each section
    Sol(i) = (B*c(i))/(2*pi*r);
    % find velocity of relative wind 
    calU(i) = sqrt((r*w)^2*+(2/3*Vs)^2); 
    
    % find induced factor for each section
    %TSRr_new(i) = r*w/calU(i);
    Phi_new_rad(i) = atan(2*Vs/(3*r*w));
    Phi_new_deg(i) = Phi_new_rad(i)*(180/pi);
    AOA_new(i) = Phi_new_deg(i)- Pitch_angle(i);
        
    % find Cl and Cd from airfoil data using curve fitting
    Cl(i) = spline(cla,clf,AOA_new(i));
    Cd(i) = spline(cla,cdf,AOA_new(i));
    
    % the valve of a and a' in an induced factor
    a_up(i) = 1+4*(sin(Phi_new_rad(i)))^2;       
    a_down(i) = Sol(i)*Cl(i)*cos(Phi_new_rad(i));
    a(i) = 1/(a_up(i)/a_down(i));   
    a_dash_in(i) = (4*cos(Phi_new_rad(i)))/(Sol(i)*Cl(i));
    a_dash_det(i) =  a_dash_in(i)-1;
    a_dash(i) = 1/a_dash_det(i);
    TSRr_new(i) = (a(i)/a_dash(i))*tan(Phi_new_rad(i));
   
      %% Momentum Theory and Blade Element Theory     
    T_b(k,i) = B*0.5*Density*calU(i)^2*c(i)*(R-R_hub/10)*r*(Cl(i)*sin(Phi_new_rad(i))-Cd(i)*cos(Phi_new_rad(i)));
    %T(k,i) = Sol(i)*pi*Density*(Vs^2*(1-a(i))^2/(sin(Phi_new_rad(i)))^2)*((Cl(i)*sin(Phi_new_rad(i)))-(Cd(i)*cos(Phi_new_rad(i))))*r^2*(R-R_hub/10);
    T_m(k,i) = 4*a_dash(i)*(1-a(i))*Density*(2/3*Vs)*pi*r^3*w*(R-R_hub/10);
    Torque_b(k) = T_b(k,i); 
    Torque_m(k) = T_m(k,i);

      %% Tip loss
% find mean radius of each section
    r_c(i) = r;
    if i == 1
        r_m(i) = r_c(i)/2;
    else
        r_m(i) = (r_c(i)+r_c(i-1))/2;
    end   
    % find the correction factor
    factorf_1(i) = 1-r_m(i)/R_tip;
    factorf_2(i) = factorf_1(i)*(B/2);
    factorf_3(i) = (r_m(i)/R_tip)*sin(Phi_new_rad(i));
    factorf_4(i) = factorf_2(i)/factorf_3(i);
    factorf_5(i) = exp(-factorf_4(i));
    Fa(i) = (2/pi)*acos(factorf_5(i));
    
    % find Cl and Cd with correction factor from airfoil data using curve fitting
    Cl_c(i) = Fa(i)*Cl(i);
    Cd_c(i) = Fa(i)*Cd(i);
    
   % the valve of a and a' with correction factor
    a_up_c(i) = 1+4*Fa(i)*(sin(Phi_new_rad(i)))^2;
    a_down_c(i) = Sol(i)*Cl_c(i)*cos(Phi_new_rad(i));
    a_c(i) = 1/(a_up_c(i)/a_down_c(i));
    a_dash_in_c(i) = (4*Fa(i)*cos(Phi_new_rad(i)))/(Sol(i)*Cl_c(i));
    a_dash_det_c(i) =  a_dash_in_c(i)-1;
    a_dash_c(i) = 1/a_dash_det_c(i);
    
      %% Torque with tip loss
    T_c(k,i) = Fa(i)*4*a_dash_c(i)*(1-a_c(i))*Density*(2/3*Vs)*pi*r^3*w*(R-R_hub/10);
    Torque_c(k) = T_c(k,i);
    SumTorque_c = sum(Torque_c);  
    
      %% Power coefficient
    if i > 1 && k > 1
    cp(k-1,i-1) = (8/TSR^2)*a_dash(i)*(1-a(i))*(1-(Cd(i)/Cl(i))*cot(Pitch_angle(i)))*((TSRr(i)^4-TSRr(1)^4)/4);  
    %cp(k,i-1) = (8/TSR*10)*(sin(Phi_new_rad(i)))^2*(cos(Phi_new_rad(i))-TSRr(i)*sin(Phi_new_rad(i)))*(sin(Phi_new_rad(i))+TSRr(i)*cos(Phi_new_rad(i)))*(1-(Cd(i)/Cl(i))*cot(Phi_new_rad(i)))*TSRr(i)^2;
    %x(i) = linspace(TSRr_new(1),TSRr_new(i),100);
    %y = a_dash(i)*(1-a(i))*(1-(Cd(i)/Cl(i))*cot(Pitch_angle(i)))*x(i)^3;
    %z(i) = trapz(x,y);
    %cp(k,i) = z(i)*(8/TSR^2);
    %cp(k,i) = 4*a(i)*(1-a(i))^2;
    calCp(k) = cp(k-1,i-1);
    % Cp for each section wih correction factor
    cp_c(k-1,i-1) = Fa(i)*(8/TSR^2)*a_dash_c(i)*(1-a_c(i))*(1-(Cd_c(i)/Cl_c(i))*cot(Pitch_angle(i)))*((TSRr(i)^4-TSRr(1)^4)/4); 
    %cp_c(k,i) = (8/(TSRr_new(i)^2))*F(i)*Factor_a_dash_c(i)*(1-Factor_a_c(i))*(1-Cd(i)/Cl(i)*cot(Pitch_angle(i)))*((TSRr_new(i)^4-TSRr_new(i-1)^4)/4);
    calCp_c(k) = cp_c(k-1,i-1);
    %else
    end    
  end
  %z(k) = trapz(x,y);
  %cp(k) = z(k)*(8/TSR^2);
end
  rpm = 0:100:900;
  plot(rpm,Torque_m);
  grid on;
  title('plot of Torque vs rpm');
  xlabel('rpm');
  ylabel('Torque');
  figure;
  plot(rpm,Torque_c);
  grid on;
  title('plot of Torque vs rpm with tip loss');
  xlabel('rpm');
  ylabel('Torque');
  figure;
  tsr = 0:1:9;
  plot(tsr,calCp_c);
  grid on;
  title('plot of Cp vs TSR');
  xlabel('TSR');
  ylabel('Cp');
  