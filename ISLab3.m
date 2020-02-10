x = 0.1:1/22:1;
d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;

%c_1, r_1, c_2 ir r_2 buvo parinkti rankiniu budu
c_1 = 0.19;
r_1 = 0.17;
c_2 = 0.89;
r_2 = 0.2;
w_1 = randn(1);
w_2 = randn(1);
w_0 = randn(1);
y = zeros(1,20);

for k = 1:100 % prasukame simta kartu, kad nusistovetu svoriu reiksmes
    for i = 1:20
        y_1 = exp(-(x(i) - c_1)^2/(2*r_1^2));
        y_2 = exp(-(x(i) - c_2)^2/(2*r_2^2));
        y(i) = y_1*w_1 + y_2*w_2 + w_0;
        
        e(i) = d(i) - y(i);
        err = err + abs(e(i));
        
        n = 0.1;
        w_1 = w_1 + n*e(i)*y_1;
        w_2 = w_2 + n*e(i)*y_2;
        w_0 = w_0 + n*e(i);
    end
end

plot(x, y, 'ro', x, d, 'kx') %atvaizduojame aproksimacija raudonais apskritimais, tikslo funkcija - juodais kryziukais