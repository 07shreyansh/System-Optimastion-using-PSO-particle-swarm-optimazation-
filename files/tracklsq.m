function F = tracklsq(pid)
         % Track the output of optsim to a signal of 1
        
         % Variables a1 and a2 are shared with RUNTRACKLSQ
         Kp = abs(pid(1));
         Ki = abs(pid(2));
         Kd = abs(pid(3));
         
         sprintf('The value of interation Kp= %3.0f, Kd= %3.0f', pid(1),pid(2)); 
         % Compute function value
         simopt = simset('solver','ode5','SrcWorkspace','Current','DstWorkspace','Current');  % Initialize sim options
         [tout,xout,yout] = sim('Systeme_a_Optimse',[0 10],simopt);
         e=yout-1 ;  % compute the error 
         sys_overshoot=max(yout)-1; % compute the overshoot
         
      alpha=10;beta=10;
      F=e2*beta+sys_overshoot*alpha;
         
    end
    