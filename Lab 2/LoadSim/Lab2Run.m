function Lab2Run()
    %% Part A
    % Run part a sim first then run this section
    %Load Data
    A5260252
    figure(1); clf; hold on;
    %Scale experimental data to s and rpm
    plot(RUN(:,1)/1000, RUN(:,3)/(8192/60), 'r')
    plot(out.MotorSpeed, 'b')
    xlabel('Time (s)');
    ylabel('Speed (rpm)');
    title('Design Verification');
    legend('Experimental', 'Simulation');
    hold off;

    
    %% PART B - 
    % Run part b sim first then run this section
    %Load Part B
    B5260252
    
    figure(2); clf; hold on;
    %Scale experimental data to s and rpm
    plot(RUN(:,1)/1000, RUN(:,3)/(8192/60), 'r')
    plot(out.MotorSpeed, 'b')
    xlabel('Time (s)');
    ylabel('Speed (rpm)');
    title('Disturbance Rejection');
    legend('Experimental', 'Simulation');
    hold off;
    
end