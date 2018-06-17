function [xmin, xmax, ymin, ymax] = getlim
    x_axe = xlim;
    y_axe = ylim;
    xmin = x_axe(1);
    xmax = x_axe(2);
    ymin = y_axe(1);
    ymax = y_axe(2);