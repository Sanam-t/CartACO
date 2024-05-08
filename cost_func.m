function cost_valuex=cost_func(kx)

assignin('base', 'Px',kx(1))
assignin('base', 'Ix',kx(2))
assignin('base', 'Dx',kx(3))

assignin('base', 'Pt',kx(4))
assignin('base', 'It',kx(5))
assignin('base', 'Dt',kx(6))

error_triggered = false;

try % to avoid run time error in case of unstable parameters
    out=sim('cartepole2.slx');
catch ME
    if (strcmp(ME.identifier,'Simulink:Engine:DerivNotFinite'))
        cost_value = inf;
        error_triggered = true;
    else
        rethrow(ME)
    end
end
    ex=out.ex;
if ~error_triggered
    errx=ex;
    [nx,~]=size(errx);
    cost_valuex=0;
    for i=1:nx
        %  cost_value=cost_value+(err(i))^2 ;  % ISE
          cost_valuex=cost_valuex+abs(errx(i));  % IAE
%         cost_valuex=cost_valuex+t(i)*abs(errx(i));% ITAE
%           cost_valuex=cost_valuex+t(i)*(errx(i))^2;  % MSE
    end
    %   cost_value=cost_value/t(n);  % MSE
    
%     if plotfig
%         figure(3)
%         plot(t,reference,t,output)
%     end
end
end

