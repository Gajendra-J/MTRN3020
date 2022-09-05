function Lab3Run
%% Part A
    A5260252;

    figure(11); clf; hold on;
    plot(RUN(:,1)/1000, RUN(:,4), 'r')
    plot(out.MotorPosition, 'b')
    xlabel('Time (s)');
    ylabel('Arm Angular Position (encoder counts)');
    title('Part A - Design Verification of Controller');
    legend('Experimental', 'Simulation');
    hold off;

%% Part B   
    B5260252;

    figure(11); clf; hold on;
    plot(RUN(:,1)/1000, RUN(:,4), 'r')
    plot(out.MotorPosition, 'b')
    xlabel('Time (s)');
    ylabel('Arm Angular Position (encoder counts)');
    title('Part B - Effect of Modelling Uncertainties');
    legend('Experimental', 'Simulation');
    hold off;
end