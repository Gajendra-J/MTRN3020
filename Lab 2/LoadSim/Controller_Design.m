noload;

A = max(TEST(:,3))/24      % I think this is common
A = A - 80
T = 6/1000;
tau = TEST(max(find(TEST(:,3) < max(TEST(:,3))*(63/100))),1)/1000
tau = tau + 0.001
tau_d = 0.045;


figure(1); clf; hold on;
A1 = A*24;
t = (0:0.008:0.400);
y = A1*(1-exp(-t/tau));
plot(TEST(:,1)/1000,TEST(:,3), 'r');
plot(t, y, 'b');
xlabel('Time (s)');
ylabel('Speed (count/s)');
title('Speed vs Time');
legend('Experimental', 'Theoretical');
hold off;


num = [24*A];
den = 126*[tau 1 0];
[numd, dend] = c2dm(num,den,T,'zoh');

disp('roots numd');
roots(numd)
disp('roots dend');
roots(dend)

p_1 = roots(dend);
p_1 = p_1(2,1)
z_1 = roots(numd)
C = numd(2)

B_0 = ((1-exp((-T)/tau_d))/(1-z_1))

e = exp(-T/tau_d)

Gc = tf((T*B_0/C)*[1 -p_1 0], [1,  -(B_0 + e), B_0 * z_1], T)