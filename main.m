function main
    close all
    clearvars
 
    % Add the UI components
    hs = addcomponents;
 
    % Make figure visible after adding components
    hs.fig.Visible = 'on';
    
    % Def param init
    xmin=-2;
    xmax=2;
    ymin=-2;
    ymax=2;
    precis=500;
    ite=15;
    
    % Calc and plot init
    [Z,C,divergence] = calcul_mandelbrot(xmin,xmax,ymin,ymax,precis,ite);
    
    afficher(C,divergence)
    set(hs.txt_precis,'String','Nombre de points : '+string(precis)+'²');
    set(hs.txt_ite,'String',"Nombre d'itérations : "+string(ite));
    
    function hs = addcomponents
        hs.fig = figure('Visible', 'off', 'Tag', 'fig');
        z = zoom;
        z.ActionPostCallback = @resizeui;

        hs.sldider_precis = uicontrol('Style', 'slider', 'position', [10 10 300 10], 'Value', 500, 'min', 100, 'max', 5000, 'SliderStep', [50/(5000-100) 100/(5000-100)], 'Callback', @sliderPrecis_Callback);
        hs.txt_precis = uicontrol('Style','text','position', [10 20 130 20],'String','Nombre de points');

        hs.sldider_ite = uicontrol('Style', 'slider', 'position', [320 10 300 10], 'Value', 15, 'min', 15, 'max', 1500, 'SliderStep', [15/(1500-15) 30/(1500-15)], 'Callback', @sliderIte_Callback);
        hs.txt_ite = uicontrol('Style','text','position', [320 20 130 20],'String',"Nombre d'itérations");  
    end
 
    function resizeui(~, ~)
        [xmin, xmax, ymin, ymax] = getlim;
        
        [Z,C,divergence] = calcul_mandelbrot(xmin,xmax,ymin,ymax,precis,ite);
        
        afficher(C,divergence)
        axis('equal')
        set(hs.txt_precis,'String','Nombre de points : '+string(precis)+'²');
        set(hs.txt_ite,'String',"Nombre d'itérations : "+string(ite));
    end
 
    function sliderPrecis_Callback(slider, ~)
        [xmin, xmax, ymin, ymax] = getlim;
        precis = round(slider.Value);
        
        [Z,C,divergence] = calcul_mandelbrot(xmin,xmax,ymin,ymax,precis,ite);
     
        afficher(C,divergence)
        axis([xmin xmax ymin ymax])
        axis('equal')
        set(hs.txt_precis,'String','Nombre de points : '+string(precis)+'²');
        set(hs.txt_ite,'String',"Nombre d'itérations : "+string(ite));
    end

    function sliderIte_Callback(slider, ~)
        [xmin, xmax, ymin, ymax] = getlim;
        ite = round(slider.Value);
        
        [Z,C,divergence] = calcul_mandelbrot(xmin,xmax,ymin,ymax,precis,ite);
     
        afficher(C,divergence)
        axis([xmin xmax ymin ymax])
        axis('equal')
        set(hs.txt_precis,'String','Nombre de points : '+string(precis)+'²');
        set(hs.txt_ite,'String',"Nombre d'itérations : "+string(ite));
    end
end
