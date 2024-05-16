

%% Initialisation
clear
clc
n = 50;          
bird_setp  =50;   
dim = 3;          

c2 =1.2;          % Parameter C1,C2 
c1 = 0.12;         
w =0.9;             
fitness=0*ones(n,bird_setp); %

                                      
                                       
R1 = rand(dim, n)*10;
R2 = rand(dim, n)*10;
current_fitness =0*ones(n,1);

                          
                                 
for i=1:n
    current_position(1,i)=0.78;
    current_position(2,i)=0.0002;
    current_position(3,i)=1.07;
end;
velocity = .3*randn(dim, n) ;
local_best_position  = current_position ;


                               

for i = 1:n
    current_fitness(i) = tracklsq(current_position(:,i));  
end


local_best_fitness  = current_fitness ;
[global_best_fitness,g] = min(local_best_fitness) ;

for i=1:n
    globl_best_position(:,i) = local_best_position(:,g) ;
end
                                               %-------------------%
                                               %  VELOCITY UPDATE  %
                                               %-------------------%

velocity = w *velocity + c1*(R1.*(local_best_position-current_position)) + c2*(R2.*(globl_best_position-current_position));

                                               %------------------%
                                               %   SWARMUPDATE    %
                                               %------------------%
                                               
            
current_position = current_position + velocity ;

                                            \
                                               %  evaluate a new swarm   %
                                             
                                               

%% Main Loop
iter = 0 ;        % Iterationscounter
while  ( iter < bird_setp )
iter = iter + 1;

for i = 1:n,
current_fitness(i) = tracklsq(current_position(:,i)) ;    
end


for i = 1 : n
        if current_fitness(i) < local_best_fitness(i)
           local_best_fitness(i)  = current_fitness(i);  
           local_best_position(:,i) = current_position(:,i)   ;
        end   
 end

  
 [current_global_best_fitness,g] = min(local_best_fitness);
  
    
if current_global_best_fitness < global_best_fitness
   global_best_fitness = current_global_best_fitness;
   
    for i=1:n
        globl_best_position(:,i) = local_best_position(:,g);
    end
   
end


 velocity = w *velocity + c1*(R1.*(local_best_position-current_position)) + c2*(R2.*(globl_best_position-current_position));
 current_position = current_position + 10*rand-5 %velocity; 
  
 sprintf('The value of interation iter %3.0f ', iter );


end % end of while loop its mean the end of all step that the birds move it 
                      

            xx=globl_best_position(:,g);
            [Y,I] = min(xx);
            current_position=globl_best_position(:,g)

            Kp=abs(xx(1))
            Ki=abs(xx(2))
            Kd=abs(xx(3))


    

%          
         