function afficher(C,divergence)
    scatter(real(C(:)), imag(C(:)), 15,divergence(:), 'filled')
    axis('equal')
    colormap jet
