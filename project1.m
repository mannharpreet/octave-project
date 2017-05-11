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



x1=0;
x2=1500;
y1=0;
y2=1500;
x = [x1, x2, x2, x1, x1];
y = [y1, y1, y2, y2, y1];
plot(x, y, 'b-', 'LineWidth', 3); hold on;



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

xlabel ('km','fontsize',16)
ylabel ('km','fontsize',16)
title ('Position of users and μeNBs')



grid on;

user_sinr1 = SINR_calculation (cluster_user_loc1,cluster_users(1),ueNB_loc,MeNB_loc,PtxM,Ptxu,GM,Gu,BM,Bu,freq);
