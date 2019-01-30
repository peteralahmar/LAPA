% PA4

q = 1.6021e-19; %electron charge
iteration = 500; % iteration

nx=10;
ny=10; 

dx= 2/(nx-1);
dy= 2/(ny-1); 

v = zeros(nx,ny);
v_old = zeros(nx,ny);
v(:,1) =1;

for it = 1:iteration 
    for j= 1: ny
        for i= 1: nx    
            %v_old = v; 
            %pause(0.1);
            if i==1 %right side
                
                %v(i,j) =(v(i+1,j) +v(i,j+1)+v(i,j-1))/3;
                v(i,j) = 1;
            elseif i==nx %left side
                
                %v(i,j) =(v(i-1,j) +v(i,j+1)+v(i,j-1))/3;
                v(i,j) = 1;
            elseif j==1 %top side
                
                %v(i,j) =(v(i+1,j) +v(i-1,j) +v(i,j+1))/3;
                v(i,j) = 0;
            elseif j==ny %bottom side
               
                %v(i,j) =(v(i+1,j) +v(i-1,j) +v(i,j-1))/3;
                v(i,j) = 0;
            else
                
                v(i,j) =(v(i+1,j) +v(i-1,j) +v(i,j+1)+v(i,j-1))/4;
            end
        end
        
    end
     surf(v);
     pause(0.01);
end

[ex,ey] = gradient(v);
figure;
quiver(-ex,-ey)