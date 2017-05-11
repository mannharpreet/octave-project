l = 1500;      % length of MeNB Coverage Square (metres)
m = 16;        % Number of uenb in MeNB
BM = 20;       % BW of MeNB (MHz)
Bu = 5;        % BW of ueNB (MHz)
GM = 16;       % Gain of MeNB Ae (dB)
Gu = 10;       % Gain of ueNB Ae (dB)
PtxM = 30;     % Power of MeNB Txn (Watts)
Ptxu = 10;     % Power of ueNB Txn (Watts)
r = 50;        % Radius of ueNB coverage area (metres)
Beta = 2/3;    % Fraction of clustered users
Delta = 500;   % Users per kilometre Square
freq = 800;    % Freq band of LTE MHz


Nu = Delta * l/1000 *l/1000;    % Total Number of Users

MeNB_loc = [ l/2,l/2];          % Fixed location of MeNB
ueNB_loc = zeros(m,2);
ueNB_loc = uenb_distr (m,l);    % Function call to generate 16 ueNB locations
%ueNB_loc = uenb_distr1 (r,l,m);

clusters = 1:16;
cluster_mean = (Nu * Beta )/m;                % Mean for Poisson RV for distributing Users to ueNB
cluster_users =poissrnd (cluster_mean,16,1);  % Distributing Users to clusters

% User location in each cluster 
% Calling the function Cluster_user_distr with argument radius, number of user in that cluster, center coordinates of the ueNB  



cluster_user_loc1 = zeros(cluster_users(1),2);
cluster_user_loc1 = Cluster_user_distr (r, cluster_users(1),ueNB_loc(1,1), ueNB_loc(1,2)); 




cluster_user_loc2 = zeros(cluster_users(2),2);
cluster_user_loc2 = Cluster_user_distr (r, cluster_users(2),ueNB_loc(2,1), ueNB_loc(2,2));

cluster_user_loc3 = zeros(cluster_users(3),2);
cluster_user_loc3 = Cluster_user_distr (r, cluster_users(3),ueNB_loc(3,1), ueNB_loc(3,2));

cluster_user_loc4 = zeros(cluster_users(4),2);
cluster_user_loc4 = Cluster_user_distr (r, cluster_users(4),ueNB_loc(4,1), ueNB_loc(4,2));

cluster_user_loc5 = zeros(cluster_users(5),2);
cluster_user_loc5 = Cluster_user_distr (r, cluster_users(5),ueNB_loc(5,1), ueNB_loc(5,2));

cluster_user_loc6 = zeros(cluster_users(6),2);
cluster_user_loc6 = Cluster_user_distr (r, cluster_users(6),ueNB_loc(6,1), ueNB_loc(6,2));

cluster_user_loc7 = zeros(cluster_users(7),2);
cluster_user_loc7 = Cluster_user_distr (r, cluster_users(7),ueNB_loc(7,1), ueNB_loc(7,2));

cluster_user_loc8 = zeros(cluster_users(8),2);
cluster_user_loc8 = Cluster_user_distr (r, cluster_users(8),ueNB_loc(8,1), ueNB_loc(8,2));

cluster_user_loc9 = zeros(cluster_users(9),2);
cluster_user_loc9 = Cluster_user_distr (r, cluster_users(9),ueNB_loc(9,1), ueNB_loc(9,2));

cluster_user_loc10 = zeros(cluster_users(10),2);
cluster_user_loc10 = Cluster_user_distr (r, cluster_users(10),ueNB_loc(10,1), ueNB_loc(10,2));

cluster_user_loc11 = zeros(cluster_users(11),2);
cluster_user_loc11 = Cluster_user_distr (r, cluster_users(11),ueNB_loc(11,1), ueNB_loc(11,2));

cluster_user_loc12 = zeros(cluster_users(12),2);
cluster_user_loc12 = Cluster_user_distr (r, cluster_users(12),ueNB_loc(12,1), ueNB_loc(12,2));

cluster_user_loc13 = zeros(cluster_users(13),2);
cluster_user_loc13 = Cluster_user_distr (r, cluster_users(13),ueNB_loc(13,1), ueNB_loc(13,2));

cluster_user_loc14 = zeros(cluster_users(14),2);
cluster_user_loc14 = Cluster_user_distr (r, cluster_users(14),ueNB_loc(14,1), ueNB_loc(14,2));

cluster_user_loc15 = zeros(cluster_users(15),2);
cluster_user_loc15 = Cluster_user_distr (r, cluster_users(15),ueNB_loc(15,1), ueNB_loc(15,2));

cluster_user_loc16 = zeros(cluster_users(16),2);
cluster_user_loc16 = Cluster_user_distr (r, cluster_users(16),ueNB_loc(16,1), ueNB_loc(16,2));



% Generate Rest of the users.
MeNB_users = Delta * (1-Beta);
MeNB_user_loc = zeros(MeNB_users,2);
MeNB_user_loc = MeNB_user_distr (l, MeNB_users);



% Calculate SINR of each user for ueNB SINR from 1-16 and MeNB SINR at 17

% user_sinr1 = zeros (17,cluster_users(1));
user_sinr1 = SINR_calculation (cluster_user_loc1,cluster_users(1),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr2 = SINR_calculation (cluster_user_loc2,cluster_users(2),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr3 = SINR_calculation (cluster_user_loc3,cluster_users(3),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr4 = SINR_calculation (cluster_user_loc4,cluster_users(4),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr5 = SINR_calculation (cluster_user_loc5,cluster_users(5),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr6 = SINR_calculation (cluster_user_loc6,cluster_users(6),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr7 = SINR_calculation (cluster_user_loc7,cluster_users(7),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr8 = SINR_calculation (cluster_user_loc8,cluster_users(8),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr9 = SINR_calculation (cluster_user_loc9,cluster_users(9),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr10 = SINR_calculation (cluster_user_loc10,cluster_users(10),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr11 = SINR_calculation (cluster_user_loc11,cluster_users(11),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr12 = SINR_calculation (cluster_user_loc12,cluster_users(12),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr13 = SINR_calculation (cluster_user_loc13,cluster_users(13),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr14 = SINR_calculation (cluster_user_loc14,cluster_users(14),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr15 = SINR_calculation (cluster_user_loc15,cluster_users(15),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
user_sinr16 = SINR_calculation (cluster_user_loc16,cluster_users(16),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);


MeNB_sinr = SINR_calculation (MeNB_user_loc,MeNB_users,ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);


x1=0;
x2=1500;
y1=0;
y2=1500;
x = [x1, x2, x2, x1, x1];
y = [y1, y1, y2, y2, y1];
plot(x, y, 'b-', 'LineWidth', 3); hold on;


subplot(2,2,1);
scatter (ueNB_loc(:,1),ueNB_loc(:,2),[],'g','filled');hold on; 
scatter(MeNB_loc(1),MeNB_loc(2),[] ,'r','filled'); hold on;
scatter (cluster_user_loc1 (:,1),cluster_user_loc1 (:,2)); hold on;
scatter (cluster_user_loc2 (:,1),cluster_user_loc2 (:,2)); hold on;
scatter (cluster_user_loc3 (:,1),cluster_user_loc3 (:,2)); hold on;
scatter (cluster_user_loc4 (:,1),cluster_user_loc4 (:,2)); hold on;
scatter (cluster_user_loc5 (:,1),cluster_user_loc5 (:,2)); hold on;
scatter (cluster_user_loc6 (:,1),cluster_user_loc6 (:,2)); hold on;
scatter (cluster_user_loc7 (:,1),cluster_user_loc7 (:,2)); hold on;
scatter (cluster_user_loc8 (:,1),cluster_user_loc8 (:,2)); hold on;
scatter (cluster_user_loc9 (:,1),cluster_user_loc9 (:,2)); hold on;
scatter (cluster_user_loc10 (:,1),cluster_user_loc10 (:,2)); hold on;
scatter (cluster_user_loc11 (:,1),cluster_user_loc11 (:,2)); hold on;
scatter (cluster_user_loc12 (:,1),cluster_user_loc12 (:,2)); hold on;
scatter (cluster_user_loc13 (:,1),cluster_user_loc13 (:,2)); hold on;
scatter (cluster_user_loc14 (:,1),cluster_user_loc14 (:,2)); hold on;
scatter (cluster_user_loc15 (:,1),cluster_user_loc15 (:,2)); hold on;
scatter (cluster_user_loc16 (:,1),cluster_user_loc16 (:,2)); hold on;
scatter (MeNB_user_loc (:,1),MeNB_user_loc (:,2))




grid on;




% EURA Algorithm

Xj  = 0.12;                     % Hardware Factor of accelaration of faults
CE  = zeros (1440,1);           % Total Cost of Energy
AF  = zeros (16,1);             % Total Accelartion Factor
CR  = zeros (1440,1);           % Total Cost of Reparation
UTOT= zeros (1440,1);           % Utitlity total
ut  = zeros (1440,1);           % Utitlity
ST  = zeros (1440,1);           % Total Sustainiability
PM  = 1;                        % Power Consumed by MeNB
Pu  = 0.2;                      % Power Consumed by ueNB
cost_of_power = 0.16;           % Rate of power kwh/USD
cost_of_repair = 380;           % Rate of repair kwh/USD
Tj  = zeros (16,1);             % Total time spent in SM by eNB j up to time t
Mj  = zeros (16,1);             % Total number of active power- SM transitions experienced bythe eNB
Theta = 1.14e-5;                % [1/h] is the failure rate of the μeNB when it is always left in active power (i.e., no SM is applied)
AFs = 0.2;
Rj = zeros (16,1);              % Average bit rate obtained by a clustered_user
Umin= 3.3e-4;
Umax= 3.8e-3;
Rmin= 164;
Rmax= 2000;



% Initialization of Metrics required for EURA

%Tj(1)=0;                        % No time spent in sleep mode (if in sleep mode add 1to that enb )
%Mj(1)=0;                        % No SM to power Transition (Incr Every time on transition)

subplot(2,2,2);
x = linspace (0, 8*pi, 96);
y = 0.4 * sin(x)+ 0.6+ (randn (1,96))/20;
plot (x,y)


% Depiction of Variation of users with time.
x = linspace (0, 120*pi, 1440);
y = 0.4 * sin(x)+ 0.6;


Delta_t = y * Delta;                  % Variation of User Density with time     
Nu_t = Delta_t * l/1000 *l/1000;      % Variation of toatl users with time
MeNB_users_t = Nu_t * (1-Beta);       % Variation of MeNB users with time
cluster_mean_t  = (Nu_t * Beta )/m;   % Variation of Mean for Poisson RV for distributing Users to ueNB

uenb_state = ones (16,1);             % To keep track of uenb (1 for ON and 0 - OFF)
uenb_on = Uenb_Status (uenb_state);


CE(1)= (PM + Pu* uenb_on)* cost_of_power;   % Cost of Electricity at time t=1
AF = Calc_AF (AFs, Tj,Xj,Mj);               % Accleration Factor at time t=1
CR(1) = cost_of_repair * sum (AF) * Theta;  % Cost of repair at time t=1  
cluster_users_t = poissrnd (cluster_mean_t(1),16,1); % Computation of users in each cluster at time t=1 given the mean at t=1
Rj = Calc_User_Rate (cluster_users_t);            % Calculation of user rate of each cluster.
ut(1) = Calc_utility (Rj,Umin,Umax,Rmin,Rmax);
UTOT(1) = ut(1);
ST(1) = UTOT(1) - CE(1) - CR (1);

for t = 2:1440

  %uenb_state
  Tj = Update_Tj (Tj,uenb_state);
  cluster_users_t = Calc_cluster_users (cluster_mean_t(t),uenb_state);
  Rj = Calc_User_Rate (cluster_users_t);
  uenb_on = Uenb_Status (uenb_state);
  CE(t)= Calc_cost_energy(CE (t-1),PM,Pu,uenb_on,cost_of_power);
  AF = Calc_AF (AFs, Tj,Xj,Mj);
  CR(t) = CR (t - 1) + cost_of_repair * sum (AF) * Theta;
  ut(t) = Calc_utility (Rj,Umin,Umax,Rmin,Rmax);
  UTOT(t) = UTOT (t-1) + ut(t);
  ST(t) = UTOT(t) - CE(t) - CR (t);
  Rj_mean = mean (Rj);
  Ro = MeNB_data_rate (MeNB_users_t(t)/3);
  
  if (Rj_mean > 960)
    for i = 1:m
      if (uenb_state(i)==1)
          uenb_state(i)=0;
          Mj(i) = Mj(i)+1;
          MeNB_users_t(t) = cluster_users_t(i)+ MeNB_users_t(t);
          cluster_user_t(i)=0;
      end
      Rj = Calc_User_Rate (cluster_users_t);
      Rj_mean = mean (Rj);
      if (Rj_mean<960)
        break;
      end
    end
  
  else
  
    for i = 1:m
      if (uenb_state(i)==0)
          uenb_state(i)=1;
          Mj(i) = Mj(i)+1;
          MeNB_users_t(t) = MeNB_users_t(t) - floor (cluster_mean_t(t));
          cluster_user_t(i)= floor(cluster_mean_t(t));
      end
      Rj = Calc_User_Rate (cluster_users_t);
      Rj_mean = mean (Rj);
      if (Rj_mean<960)
        break;
      end
    end
   end
 end
 
 ST= ST/500;
 subplot(2,2,3);
 plot (ST); hold on;