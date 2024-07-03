
%% Plotting cells
for i = 1:N
    for j = 1:7
       
        if j==1 | j==4 | j==7
            x1(i,j) = (ref_x);
           
        elseif j==2 | j==3
            x1(i,j) = (ref_x+x);
          
        elseif j==5 | j==6
            x1(i,j) = (ref_x-x);
         
        end

        if j==1 | j==7
            y1(i,j) = (ref_y+r);
        
        elseif j==2 | j==6
            y1(i,j) = (ref_y+y);
        
        elseif j==3 | j==5
            y1(i,j) = (ref_y-y);
       
        elseif j==4
            y1(i,j) = (ref_y-r);
      
        end
    end
    
   
    figure(1),    
    plot(x1(i,:),y1(i,:)),grid on, hold on         %%cell edge point plot
    plot(ref_x,ref_y,'o')                          %%BS plot
    axis([5 15 5 15])
    clear x1*; clear x2*;
    clear y1*; clear y2*;
   
    % saving the BS coordinate
    BS_x(i) = ref_x;
    BS_y(i) = ref_y;
    if i==1
        ref_x = initial_x+x+x;
        ref_y = initial_y;
    elseif i==2
        ref_x = initial_x+x;
        ref_y = initial_y+1+y;
    elseif i==3
        ref_x = initial_x-x;
        ref_y = initial_y+1+y;
    elseif i==4
        ref_x = initial_x-x-x;
        ref_y = initial_y;
    elseif i==5
        ref_x = initial_x-x;
        ref_y = initial_y-1-y;
    elseif i==6
        ref_x = initial_x+x;
        ref_y = initial_y-1-y;
    elseif i==7
        ref_x = initial_x+2.*(x+x);
        ref_y = initial_y;
    elseif i==8
        ref_x = initial_x+3.*x;
        ref_y = initial_y+r+y;
    elseif i==9
        ref_x = initial_x+x+x;
        ref_y = initial_y+2.*r+2.*y;
    elseif i==10
        ref_x = initial_x;
        ref_y = initial_y+2.*r+2.*y;
    elseif i==11
        ref_x = initial_x-x-x;
        ref_y = initial_y+2.*r+2.*y;
    elseif i==12
        ref_x = initial_x-3.*x;
        ref_y = initial_y+r+y;
    elseif i==13
        ref_x = initial_x-2.*(x+x);
        ref_y = initial_y;
    elseif i==14
        ref_x = initial_x-3.*x;
        ref_y = initial_y-r-y;
    elseif i==15
        ref_x = initial_x-x-x;
        ref_y = initial_y-2.*r-2.*y;
    elseif i==16
        ref_x = initial_x;
        ref_y = initial_y-2.*r-2.*y;
    elseif i==17
        ref_x = initial_x+x+x;
        ref_y = initial_y-2.*r-2.*y;
    elseif i==18
        ref_x = initial_x+3.*x;
        ref_y = initial_y-r-y;
    end
end
for cell = 1: N
    
    %% Plotting users
    % Random User Coordinate
    v_x = BS_x(cell) + (r * sin((0:6)*pi/3));
    v_y = BS_y(cell) + (r * cos((0:6)*pi/3));
    c_x = BS_x(cell) + (r-rand(1, 20*u)*2*r);
    c_y = BS_y(cell) + (r-rand(1, 20*u)*2*r);
    IN = inpolygon(c_x, c_y, v_x, v_y);
    c_x = c_x(IN);
    c_y = c_y(IN);
    idx = randperm(length(c_x));
    MS1_cell_1_x(cell,:) = c_x(idx(1:u));
    MS1_cell_1_y(cell,:) = c_y(idx(1:u));
    
    
    
    % Defining near user and far user
    for i = 1:u
        dist_MS_cell_1(i) = d*sqrt((sqrt((BS_x(cell)-MS1_cell_1_x(cell,i))^2+(BS_y(cell)-MS1_cell_1_y(cell,i))^2))^2+(BS_height/d)^2); %distance with base station's height
    end
    distance_MS_cell_1(cell,:)=dist_MS_cell_1;
    
    if distance_MS_cell_1(cell,1)>=distance_MS_cell_1(cell,2)
        
        save_MS1_cell_1_x(cell,1)=MS1_cell_1_x(cell,1);
        save_MS1_cell_1_y(cell,1)=MS1_cell_1_y(cell,1);
        MS1_cell_1_x(cell,1)=MS1_cell_1_x(cell,2);
        MS1_cell_1_x(cell,2)=save_MS1_cell_1_x(cell,1);
        MS1_cell_1_y(cell,1)=MS1_cell_1_y(cell,2);
        MS1_cell_1_y(cell,2)=save_MS1_cell_1_y(cell,1);
    end
    
    figure(1),
    plot(MS1_cell_1_x,MS1_cell_1_y,'*'),grid on, hold on
    axis([5 15 5 15])
    title('SIMULATION SCENARIO')
end

%OMA (Orthogonal Multiple Access)
for cell = 1:N
    
    % SNR cell 1
    for i = 1:u
        Pwr(i)=P(i);
        dist_MS_cell_1(i) = d*sqrt((sqrt((BS_x(1)-MS1_cell_1_x(1,i))^2+(BS_y(1)-MS1_cell_1_y(1,i))^2))^2+(BS_height/d)^2); %distance with base station's height
        
        %Cost231 & Okumura-Hata
        if PL == 1
            PL_num_cell_1(i) = 46.3 + 33.9*log10(f/1000000) - 13.28*log10(BS_height) - ((1.1*log10(f/1000000)-0.7)*MS_height-(1.56*log10(f/1000000)-0.8)) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_cell_1(i)/1000)+3; %Pathloss
            PL_dB_cell_1(i) = 10*log10(PL_num_cell_1(i));
        else
            PL_dB_cell_1(i) = 69.55 + 26.16*log10(f/1000000) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_cell_1(i)/1000) - 13.82*log10(BS_height) - (3.2*(log10(11.75*MS_height))^2 - 4.97); %Pathloss
            PL_num_cell_1(i) = 10^((PL_dB_cell_1(i))/10);
        end
        
        Rx_pwr_dBm_cell_1(i) = (10*log10(Pwr(i)*1000))-PL_dB_cell_1(i); %dBm
        Rx_pwr_mW_cell_1(i) = 10^((Rx_pwr_dBm_cell_1(i))/10);
    end
    Rx_pwr_cell_1(cell,:)=Rx_pwr_mW_cell_1;
    
    
    % Thermal Noise
    for i = 1:u
        Rx_pwr_dBm_noise_cell_1(i) = NF+No+10*log10(1/2*Bw);
        Rx_pwr_mW_noise_cell_1(i) = 10^((Rx_pwr_dBm_noise_cell_1(i))/10);
    end
    Rx_pwr_noise_cell_1(cell,:)=Rx_pwr_mW_noise_cell_1;
    
    
    % Interference Calculation for users in cell 1 from the other BS
    if  cell==1 & cell<=N
        for i = 1:u
            Interference(i)=Int(i);
        end
        total_int_pwr_mW_cell_1(cell,:)=Interference;
        
    else if cell==3 | cell==5 | cell==7 | cell==9 | cell==11 | cell==13 | cell==15 | cell==17 | cell==19
            for i = 1:u
                dist_MS_int_cell_1(i) = d*sqrt((sqrt((BS_x(cell)-MS1_cell_1_x(1,i))^2+(BS_y(cell)-MS1_cell_1_y(1,i))^2))^2+(BS_height/d)^2); %distance with base station's height
                
                %Cost231 & Okumura-Hata
                if PL==1
                    PL_num_cell_1(i) = 46.3 + 33.9*log10(f/1000000) - 13.28*log10(BS_height) - ((1.1*log10(f/1000000)-0.7)*MS_height-(1.56*log10(f/1000000)-0.8)) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_int_cell_1(i)/1000)+3; %Pathloss
                    PL_dB_int_cell_1(i) = 10*log10(PL_num_cell_1(i));
                else
                    PL_dB_int_cell_1(i) = 69.55 + 26.16*log10(f/1000000) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_int_cell_1(i)/1000) - 13.82*log10(BS_height) - (3.2*(log10(11.75*MS_height))^2 - 4.97); %Pathloss
                    PL_num_cell_1(i) = 10^((PL_dB_int_cell_1(i))/10);
                end
                
                if i==1
                    int_pwr_dBm_cell_1(i) = (10*log10(Pwr(i+1)*1000))-PL_dB_int_cell_1(i); %dBm
                    int_pwr_mW_cell_1(i) = 10^((int_pwr_dBm_cell_1(i))/10);
                else
                    int_pwr_dBm_cell_1(i) = (10*log10(Pwr(i-1)*1000))-PL_dB_int_cell_1(i); %dBm
                    int_pwr_mW_cell_1(i) = 10^((int_pwr_dBm_cell_1(i))/10);
                end
                
            end
            total_int_pwr_mW_cell_1(cell,:)=int_pwr_mW_cell_1;
            
        else
            for i = 1:u
                dist_MS_int_cell_1(i) = d*sqrt((sqrt((BS_x(cell)-MS1_cell_1_x(1,i))^2+(BS_y(cell)-MS1_cell_1_y(1,i))^2))^2+(BS_height/d)^2); %distance with base station's height
                
                %Cost231 & Okumura-Hata
                if PL==1
                    PL_num_cell_1(i) = 46.3 + 33.9*log10(f/1000000) - 13.28*log10(BS_height) - ((1.1*log10(f/1000000)-0.7)*MS_height-(1.56*log10(f/1000000)-0.8)) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_int_cell_1(i)/1000)+3; %Pathloss
                    PL_dB_int_cell_1(i) = 10*log10(PL_num_cell_1(i));
                else
                    PL_dB_int_cell_1(i) = 69.55 + 26.16*log10(f/1000000) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_int_cell_1(i)/1000) - 13.82*log10(BS_height) - (3.2*(log10(11.75*MS_height))^2 - 4.97); %Pathloss
                    PL_num_cell_1(i) = 10^((PL_dB_int_cell_1(i))/10);
                end
                
                if i==1
                    int_pwr_dBm_cell_1(i) = (10*log10(Pwr(i)*1000))-PL_dB_int_cell_1(i); %dBm
                    int_pwr_mW_cell_1(i) = 10^((int_pwr_dBm_cell_1(i))/10);
                else
                    int_pwr_dBm_cell_1(i) = (10*log10(Pwr(i)*1000))-PL_dB_int_cell_1(i); %dBm
                    int_pwr_mW_cell_1(i) = 10^((int_pwr_dBm_cell_1(i))/10);
                end
                
            end
            total_int_pwr_mW_cell_1(cell,:)=int_pwr_mW_cell_1;
            
        end
    end
    
    
    if cell==1
        total_inter_pwr_cell_1_OMA=total_int_pwr_mW_cell_1(cell,:);
        total_inter_pwr_mW_cell_1_OMA(cell,:)=total_inter_pwr_cell_1_OMA;
        total_inter_pwr_dBm_cell_1_OMA(cell,:)=10*log10(total_inter_pwr_mW_cell_1_OMA(cell,:));
        
    else
        total_inter_pwr_cell_1_OMA=total_int_pwr_mW_cell_1(cell,:)+total_inter_pwr_mW_cell_1_OMA(cell-1,:);
        total_inter_pwr_mW_cell_1_OMA(cell,:)=total_inter_pwr_cell_1_OMA;
        total_inter_pwr_dBm_cell_1_OMA(cell,:)=10*log10(total_inter_pwr_mW_cell_1_OMA(cell,:));
        
    end
    
end

for cell = 1:N
    % Capacity
    SINR_mW_cell_1_OMA = Rx_pwr_cell_1(cell,:)./(total_inter_pwr_mW_cell_1_OMA(cell,:)+Rx_pwr_noise_cell_1(cell,:)); %Capacity UE1 and UE2 in numeric
    SINR_num_cell_1_OMA(cell,:) = SINR_mW_cell_1_OMA;
    SINR_dBm_cell_1_OMA = SINR_num_cell_1_OMA(cell,:); %Capacity UE1 and UE2 in dBm
    SINR_dB_cell_1_OMA(cell,:) = SINR_dBm_cell_1_OMA;
    total_Capacity_cell_1_OMA = (1/2*Bw/1000000)*log2(1+SINR_num_cell_1_OMA(cell,:));
    total_Cap_cell_1_OMA(cell,:) = total_Capacity_cell_1_OMA;
end


%NOMA (Non-Orthogonal Multiple Access)
for cell = 1:N
    
    % SNR cell 1
    for i = 1:u
        Pwr(i)=P(i);
        dist_MS_cell_1(i) = d*sqrt((sqrt((BS_x(1)-MS1_cell_1_x(1,i))^2+(BS_y(1)-MS1_cell_1_y(1,i))^2))^2+(BS_height/d)^2); %distance with base station's height
        
        %Cost231 & Okumura-Hata
        if PL == 1
            PL_num_cell_1(i) = 46.3 + 33.9*log10(f/1000000) - 13.28*log10(BS_height) - ((1.1*log10(f/1000000)-0.7)*MS_height-(1.56*log10(f/1000000)-0.8)) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_cell_1(i)/1000)+3; %Pathloss
            PL_dB_cell_1(i) = 10*log10(PL_num_cell_1(i));
        else
            PL_dB_cell_1(i) = 69.55 + 26.16*log10(f/1000000) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_cell_1(i)/1000) - 13.82*log10(BS_height) - (3.2*(log10(11.75*MS_height))^2 - 4.97); %Pathloss
            PL_num_cell_1(i) = 10^((PL_dB_cell_1(i))/10);
        end
        
        Rx_pwr_dBm_cell_1(i) = (10*log10(Pwr(i)*1000))-PL_dB_cell_1(i); %dBm
        Rx_pwr_mW_cell_1(i) = 10^((Rx_pwr_dBm_cell_1(i))/10);
    end
    Rx_pwr_cell_1(cell,:)=Rx_pwr_mW_cell_1;
    
    
    % Self Interference Calculation for user 2
    for i = 1:u
        if  i==1
            Rx_pwr_mW_selfint_cell_1(i)=Int(i);
            
        else
            Pwr(i)=P(i);
            dist_MS_selfint_cell_1(i) = d*sqrt((sqrt((BS_x(1)-MS1_cell_1_x(1,i))^2+(BS_y(1)-MS1_cell_1_y(1,i))^2))^2+(BS_height/d)^2); %distance with base station's height
            
            %Cost231 & Okumura-Hata
            if PL==1
                PL_num_slftint_cell_1(i) = 46.3 + 33.9*log10(f/1000000) - 13.28*log10(BS_height) - ((1.1*log10(f/1000000)-0.7)*MS_height-(1.56*log10(f/1000000)-0.8)) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_selfint_cell_1(i)/1000)+3; %Pathloss
                PL_dB_selfint_cell_1(i) = 10*log10(PL_num_slftint_cell_1(i));
            else
                PL_dB_selfint_cell_1(i) = 69.55 + 26.16*log10(f/1000000) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_selfint_cell_1(i)/1000) - 13.82*log10(BS_height) - (3.2*(log10(11.75*MS_height))^2 - 4.97); %Pathloss
                PL_num_slftint_cell_1(i) = 10^((PL_dB_selfint_cell_1(i))/10);
            end
            
            Rx_pwr_dBm_selfint_cell_1(i) = (10*log10(Pwr(1)*1000))-PL_dB_selfint_cell_1(i); %dBm
            Rx_pwr_mW_selfint_cell_1(i) = 10^((Rx_pwr_dBm_selfint_cell_1(i))/10);
        end
    end
    Rx_pwr_selfint_cell_1(cell,:)=Rx_pwr_mW_selfint_cell_1;
    
    
    % Imperfect SIC
    for i = 1:u
        if  i==1
            Im_SIC(i)=10^(imdB*1000/10);
        else
            Im_SIC(i)=Int(i);
        end
    end
    Imperfect_SIC_cell_1(cell,:)=Im_SIC;
    
    % Thermal Noise
    for i = 1:u
        Rx_pwr_dBm_noise_cell_1(i) = NF+No+10*log10(Bw);
        Rx_pwr_mW_noise_cell_1(i) = 10^((Rx_pwr_dBm_noise_cell_1(i))/10);
    end
    Rx_pwr_noise_cell_1(cell,:)=Rx_pwr_mW_noise_cell_1;
    
    
    % Interference Calculation for users in cell 1 from the other BS
    if  cell==1 & cell<=N
        for i = 1:u
            Interference(i)=Int(i);
        end
        total_int_pwr_mW_cell_1(cell,:)=Interference;
        
    else
        for i = 1:u
            dist_MS_int_cell_1(i) = d*sqrt((sqrt((BS_x(cell)-MS1_cell_1_x(1,i))^2+(BS_y(cell)-MS1_cell_1_y(1,i))^2))^2+(BS_height/d)^2); %distance with base station's height
            
            %Cost231 & Okumura-Hata
            if PL==1
                PL_num_cell_1(i) = 46.3 + 33.9*log10(f/1000000) - 13.28*log10(BS_height) - ((1.1*log10(f/1000000)-0.7)*MS_height-(1.56*log10(f/1000000)-0.8)) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_int_cell_1(i)/1000)+3; %Pathloss
                PL_dB_int_cell_1(i) = 10*log10(PL_num_cell_1(i));
            else
                PL_dB_int_cell_1(i) = 69.55 + 26.16*log10(f/1000000) + (44.9 - 6.55*log10(BS_height))*log10(dist_MS_int_cell_1(i)/1000) - 13.82*log10(BS_height) - (3.2*(log10(11.75*MS_height))^2 - 4.97); %Pathloss
                PL_num_cell_1(i) = 10^((PL_dB_int_cell_1(i))/10);
            end
            
            int_pwr_dBm_cell_1(i) = (10*log10(Tx_Pwr*1000))-PL_dB_int_cell_1(i); %dBm
            int_pwr_mW_cell_1(i) = 10^((int_pwr_dBm_cell_1(i))/10);
        end
        total_int_pwr_mW_cell_1(cell,:)=int_pwr_mW_cell_1;
    end
    
    
    if cell==1
        total_inter_pwr_cell_1=total_int_pwr_mW_cell_1(cell,:);
        total_inter_pwr_mW_cell_1(cell,:)=total_inter_pwr_cell_1;
        total_inter_pwr_dBm_cell_1(cell,:)=10*log10(total_inter_pwr_mW_cell_1(cell,:));
        
    else
        total_inter_pwr_cell_1=total_int_pwr_mW_cell_1(cell,:)+total_inter_pwr_mW_cell_1(cell-1,:);
        total_inter_pwr_mW_cell_1(cell,:)=total_inter_pwr_cell_1;
        total_inter_pwr_dBm_cell_1(cell,:)=10*log10(total_inter_pwr_mW_cell_1(cell,:));
        
    end
    
end


for cell = 1:N
    % Capacity
    SINR_mW_cell_1=Rx_pwr_cell_1(cell,:)./(Imperfect_SIC_cell_1(1,:)+Rx_pwr_selfint_cell_1(1,:)+total_inter_pwr_mW_cell_1(cell,:)+Rx_pwr_noise_cell_1(cell,:)); %Capacity UE1 and UE2 in numeric
    SINR_num_cell_1(cell,:)=SINR_mW_cell_1;
    SINR_dBm_cell_1=SINR_num_cell_1(cell,:); %Capacity UE1 and UE2 in dBm
    SINR_dB_cell_1(cell,:)=SINR_dBm_cell_1;
    total_Capacity_cell_1 = (Bw/1000000)*log2(1+SINR_num_cell_1(cell,:));
    total_Cap_cell_1(cell,:)= total_Capacity_cell_1;
end



%%Capacity vs SNR in Rayleigh channel
% Calculate UE distance in cell 1 from 19 BS
for cell=1:N
    for i = 1:u
        dist_UE_cell_1(i) = sqrt((sqrt((BS_x(cell)-MS1_cell_1_x(1,i))^2+(BS_y(cell)-MS1_cell_1_y(1,i))^2))^2+(BS_height/d)^2);
    end
    distance_UE_cell_1(cell,:)=dist_UE_cell_1;
end
SNRdB = [0:5:35];
trial = 20000;
for ii=1:length(SNRdB)
    SNRdB
    for tr = 1:trial
        txSNR(ii) = 10^(SNRdB(ii)/10);
        trial=tr
        % Reyleigh Channel
        for cell=1:N
            for i=1:u
                MS_ch_index_cell_1(i) = (abs(gauss(0,distance_UE_cell_1(cell,i).^(-v)/2,1,1)+1i*gauss(0,distance_UE_cell_1(cell,i).^(-v)/2,1,1))).^2; %channel index
            end
            MS_pwr_ch_index_cell_1(cell,:) = MS_ch_index_cell_1;
        end
        
        for cell=1:N
            for i=1:u
                % SNR cell 1
                MS_pwr_cell_1(i) = MS_pwr_ch_index_cell_1(cell,i)*(Pwr(i)/Tx_Pwr); % SNR
                
                % Self Interference Calculation for FEU and Imperfect SIC for NEU
                if i==1
                    Self_int_pwr_cell_1(i) = Int(i); % Self Interference Calculation
                    Im_int_pwr_cell_1(i) = im; % Imperfect SIC SCENARIO 1
                    
                else
                    Self_int_pwr_cell_1(i) = MS_pwr_ch_index_cell_1(1,i)*(Pwr(i-1)/Tx_Pwr); % Self Interference Calculation
                    Im_int_pwr_cell_1(i) = Int(i); % Imperfect SIC
                end
            end
            MS_power_cell_1(cell,:)=MS_pwr_cell_1;
            Self_int_power_cell_1(cell,:)=Self_int_pwr_cell_1;
            Im_int_power_cell_1(cell,:)=Im_int_pwr_cell_1;
            
            % Intercell Interference Calculation for users in cell 1 from the other BS
            % OMA
            if cell==1
                for i = 1:u
                    OMA_Inter_int_ch_index_cell_1(i)=Int(i)*(Pwr(i)/Tx_Pwr);
                end
                OMA_Intercell_int_pwr_cell_1(cell,:)=OMA_Inter_int_ch_index_cell_1; % intercell interference cell 1
                
            else if cell==3 | cell==5 | cell==7 | cell==9 | cell==11 | cell==13 | cell==15 | cell==17 | cell==19
                    for i = 1:u
                        if i==1
                            OMA_Inter_int_ch_index_cell_1(i) = MS_pwr_ch_index_cell_1(cell,i)*(Pwr(i+1)/Tx_Pwr);
                        else
                            OMA_Inter_int_ch_index_cell_1(i) = MS_pwr_ch_index_cell_1(cell,i)*(Pwr(i-1)/Tx_Pwr);
                        end
                    end
                    OMA_Intercell_int_pwr_cell_1(cell,:)= OMA_Inter_int_ch_index_cell_1; % intercell interference cell 1
                else
                    for i = 1:u
                        OMA_Inter_int_ch_index_cell_1(i) = MS_pwr_ch_index_cell_1(cell,i)*(Pwr(i)/Tx_Pwr);
                    end
                    OMA_Intercell_int_pwr_cell_1(cell,:)= OMA_Inter_int_ch_index_cell_1; % intercell interference cell 1
                end
            end
            
            if cell==1
                OMA_total_inter_int_pwr_cell_1=OMA_Intercell_int_pwr_cell_1(cell,:); % Sum Interference
                OMA_total_intercell_int_pwr_cell_1(cell,:)=OMA_total_inter_int_pwr_cell_1; % total intercell interference cell 1
            else
                OMA_total_inter_int_pwr_cell_1=OMA_Intercell_int_pwr_cell_1(cell,:)+OMA_total_intercell_int_pwr_cell_1(cell-1,:); % Sum Interference
                OMA_total_intercell_int_pwr_cell_1(cell,:)=OMA_total_inter_int_pwr_cell_1; % total intercell interference cell 1
            end
            
            % NOMA
            if cell==1
                for i = 1:u
                    NOMA_Inter_int_ch_index_cell_1(i)=Int(i);
                end
                NOMA_Intercell_int_pwr_cell_1(cell,:)=NOMA_Inter_int_ch_index_cell_1; % intercell interference cell 1
                
            else
                for i = 1:u
                    NOMA_Inter_int_ch_index_cell_1(i) = MS_pwr_ch_index_cell_1(cell,i)*(Tx_Pwr/Tx_Pwr);
                end
                NOMA_Intercell_int_pwr_cell_1(cell,:)= NOMA_Inter_int_ch_index_cell_1; % intercell interference cell 1
            end
            
            if cell==1
                NOMA_total_inter_int_pwr_cell_1=NOMA_Intercell_int_pwr_cell_1(cell,:); % Sum Interference
                NOMA_total_intercell_int_pwr_cell_1(cell,:)=NOMA_total_inter_int_pwr_cell_1; % total intercell interference cell 1
            else
                NOMA_total_inter_int_pwr_cell_1=NOMA_Intercell_int_pwr_cell_1(cell,:)+NOMA_total_intercell_int_pwr_cell_1(cell-1,:); % Sum Interference
                NOMA_total_intercell_int_pwr_cell_1(cell,:)=NOMA_total_inter_int_pwr_cell_1; % total intercell interference cell 1
            end
            
        end
        
        % Shannon Capacity
        for i=1:u
            Noma_Capacity(i)=log2(1+((txSNR(ii)*MS_power_cell_1(1,i))/(txSNR(ii)*(Im_int_power_cell_1(1,i)+Self_int_power_cell_1(i)+NOMA_total_intercell_int_pwr_cell_1(N,i))+1))); % Capacity for NEU snd FEU
            Oma_Capacity(i)=(1/2)*log2(1+(txSNR(ii)*MS_power_cell_1(1,i))/(txSNR(ii)*OMA_total_intercell_int_pwr_cell_1(N,i)+1)); % Capacity for NEU snd FEU
        end
        
        % Ergodic Capacity
        %tmpC(tr,:) = Capacity;
        Noma_tmpC1(tr,:) = Noma_Capacity(1);
        Noma_tmpC2(tr,:) = Noma_Capacity(2);
        Noma_tmpCerg(tr,:) = Noma_Capacity(1)+Noma_Capacity(2);
        
        %%for OMA
        Oma_tmpC1(tr,:) = Oma_Capacity(1);
        Oma_tmpC2(tr,:) = Oma_Capacity(2);
        Oma_tmpCerg(tr,:) = Oma_Capacity(1)+ Oma_Capacity(2);
    end
    
    % Mean Ergodic Capacity
    
    Noma_C1(ii,:)=mean(Noma_tmpC1);
    Noma_C2(ii,:)=mean(Noma_tmpC2);
    Noma_Cerg(ii,:)=mean(Noma_tmpCerg);
    
    Oma_C1(ii,:)=mean(Oma_tmpC1);
    Oma_C2(ii,:)=mean(Oma_tmpC2);
    Oma_Cerg(ii,:)=mean(Oma_tmpCerg);
end



cell_plot = 1:1:N-1;

figure(2),
plot(cell_plot,total_inter_pwr_dBm_cell_1(cell_plot+1,1),'r-o','LineWidth',1.2),grid on, hold on % SNR trend for user 1 in cell 1
plot(cell_plot,total_inter_pwr_dBm_cell_1(cell_plot+1,2),'b-o','LineWidth',1.2),grid on, hold on % SNR trend for user 2 in cell 1
plot(cell_plot,total_inter_pwr_dBm_cell_1_OMA(cell_plot+1,1),'g-*','LineWidth',1.2),grid on, hold on % SNR trend for user 1 in cell 1
plot(cell_plot,total_inter_pwr_dBm_cell_1_OMA(cell_plot+1,2),'k-*','LineWidth',1.2),grid on, hold on % SNR trend for user 2 in cell 1
legend('NEU NOMA','FEU NOMA','NEU OMA','FEU OMA')
xlabel('Number of cell')
ylabel('Intercell Interference [dBm]')
% Create references
% url = 'wens.re.kr';
% labelStr = ['<html>Ref: <a href="">' url '</a></html>'];
% jLabel = javaObjectEDT('javax.swing.JLabel', labelStr);
% [hjLabel,hContainer] = javacomponent(jLabel, [10,5,100,20], gcf);
% hjLabel.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.HAND_CURSOR));
% hjLabel.setToolTipText(['Visit the ' url ' website']);
% set(hjLabel, 'MouseClickedCallback', @(h,e)web(['http://' url], '-browser'))

figure(3),
plot(cell_plot,SINR_dB_cell_1(cell_plot+1,1),'r-o','LineWidth',1.2),grid on, hold on % SNR trend for user 1 in cell 1
plot(cell_plot,SINR_dB_cell_1(cell_plot+1,2),'b-o','LineWidth',1.2),grid on, hold on % SNR trend for user 2 in cell 1
plot(cell_plot,SINR_dB_cell_1_OMA(cell_plot+1,1),'g-*','LineWidth',1.2),grid on, hold on % SNR trend for user 1 in cell 1
plot(cell_plot,SINR_dB_cell_1_OMA(cell_plot+1,2),'k-*','LineWidth',1.2),grid on, hold on % SNR trend for user 2 in cell 1
legend('NEU NOMA','FEU NOMA','NEU OMA','FEU OMA')
xlabel('Number of cell')
ylabel('SINR [dBm]')
% Create references
% url = 'wens.re.kr';
% labelStr = ['<html>Ref: <a href="">' url '</a></html>'];
% jLabel = javaObjectEDT('javax.swing.JLabel', labelStr);
% [hjLabel,hContainer] = javacomponent(jLabel, [10,5,100,20], gcf);
% hjLabel.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.HAND_CURSOR));
% hjLabel.setToolTipText(['Visit the ' url ' website']);
% set(hjLabel, 'MouseClickedCallback', @(h,e)web(['http://' url], '-browser'))

figure(4),
plot(cell_plot,total_Cap_cell_1(cell_plot+1,1),'r-o','LineWidth',1.2),grid on, hold on % Cell Capacity trend for user 1 in cell 1
plot(cell_plot,total_Cap_cell_1(cell_plot+1,2),'b-o','LineWidth',1.2),grid on, hold on % Cell Capacity trend for user 2 in cell 1
plot(cell_plot,total_Cap_cell_1_OMA(cell_plot+1,1),'g-*','LineWidth',1.2),grid on, hold on % Cell Capacity trend for user 1 in cell 1
plot(cell_plot,total_Cap_cell_1_OMA(cell_plot+1,2),'k-*','LineWidth',1.2),grid on, hold on % Cell Capacity trend for user 2 in cell 1
legend('NEU NOMA','FEU NOMA','NEU OMA','FEU OMA')
xlabel('Number of cell')
ylabel('User Capacity [Mbps/Hz]')
% Create references
% url = 'wens.re.kr';
% labelStr = ['<html>Ref: <a href="">' url '</a></html>'];
% jLabel = javaObjectEDT('javax.swing.JLabel', labelStr);
% [hjLabel,hContainer] = javacomponent(jLabel, [10,5,100,20], gcf);
% hjLabel.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.HAND_CURSOR));
% hjLabel.setToolTipText(['Visit the ' url ' website']);
% set(hjLabel, 'MouseClickedCallback', @(h,e)web(['http://' url], '-browser'))

figure(5),
plot(cell_plot,total_Cap_cell_1(cell_plot+1,1)+total_Cap_cell_1(cell_plot+1,2),'r-d','LineWidth',1.2),grid on, hold on % Cell Capacity trend for user 1 in cell 1
plot(cell_plot,total_Cap_cell_1_OMA(cell_plot+1,1)+total_Cap_cell_1_OMA(cell_plot+1,2),'b-s','LineWidth',1.2),grid on, hold on % Cell Capacity trend for user 1 in cell 1
legend('NOMA','OMA')
xlabel('Number of cell')
ylabel('Ergodic Sum Capacity [Mbps/Hz]')
% Create references
% url = 'wens.re.kr';
% labelStr = ['<html>Ref: <a href="">' url '</a></html>'];
% jLabel = javaObjectEDT('javax.swing.JLabel', labelStr);
% [hjLabel,hContainer] = javacomponent(jLabel, [10,5,100,20], gcf);
% hjLabel.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.HAND_CURSOR));
% hjLabel.setToolTipText(['Visit the ' url ' website']);
% set(hjLabel, 'MouseClickedCallback', @(h,e)web(['http://' url], '-browser'))

figure(6),
plot(SNRdB,Noma_C1,'r-o','LineWidth',1.2),grid on, hold on
plot(SNRdB,Noma_C2,'b-o','LineWidth',1.2),grid on, hold on
plot(SNRdB,Oma_C1,'g-*','LineWidth',1.2),grid on, hold on
plot(SNRdB,Oma_C2,'k-*','LineWidth',1.2),grid on, hold on
legend('NEU NOMA','FEU NOMA','NEU OMA','FEU OMA')
xlabel('Transmit SNR [dB]')
ylabel('User Capacity [bit/s/Hz]')
% Create references
% url = 'wens.re.kr';
% labelStr = ['<html>Ref: <a href="">' url '</a></html>'];
% jLabel = javaObjectEDT('javax.swing.JLabel', labelStr);
% [hjLabel,hContainer] = javacomponent(jLabel, [10,5,100,20], gcf);
% hjLabel.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.HAND_CURSOR));
% hjLabel.setToolTipText(['Visit the ' url ' website']);
% set(hjLabel, 'MouseClickedCallback', @(h,e)web(['http://' url], '-browser'))

figure(7),
plot(SNRdB,Noma_Cerg,'r-d','LineWidth',1.2),hold on, grid on
plot(SNRdB,Oma_Cerg,'b-s','LineWidth',1.2),hold on, grid on
legend('NOMA','OMA')
xlabel('Transmit SNR [dB]')
ylabel('Ergodic Sum Capacity [bit/s/Hz]')