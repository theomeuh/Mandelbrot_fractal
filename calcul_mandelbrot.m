function [Z,C,divergence] = calcul_mandelbrot(xmin,xmax,ymin,ymax,precis,ite)
    disp('Calcul commencé')
    Z = zeros(precis);
    divergence=zeros(precis);
    [X, Y] = meshgrid(linspace(xmin, xmax, precis), linspace(ymin, ymax, precis));
    C = X + 1i * Y;
    C_calc=C;
    for i = 0:ite
        Z = Z.* Z +C_calc;
        I=find(abs(Z)>2);
        divergence(I)=i;
        Z(I)=0;
        C_calc(I)=0;
    end
    divergence=divergence/(max(max(divergence)));
    disp('Calcul fini')