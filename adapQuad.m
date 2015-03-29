% Adaptive Quadrature
function result = adapQuad(ftn, Lbound , Ubound, tolerance)
    center = (Lbound + Ubound) / 2.0;
    
    if abs(trape(ftn, Lbound, Ubound) - trape(ftn, Lbound, center) - trape(ftn, center, Ubound)) < 3*tolerance
        result = trape(ftn, Lbound, center) + trape(ftn, center, Ubound);
    else
        tolerance = tolerance / 2.0;
        result = adapQuad(ftn, Lbound, center, tolerance) + adapQuad(ftn, center, Ubound, tolerance);
    end 
end

% Trapezoidal Rule
function result = trape(ftn, Lbound, Ubound)
    h = Ubound - Lbound;
    result = (ftn(Lbound) + ftn(Ubound))*h/2.0; 
end
