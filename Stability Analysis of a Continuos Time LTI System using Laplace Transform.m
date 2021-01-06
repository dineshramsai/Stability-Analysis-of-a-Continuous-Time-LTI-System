%Stability Analysis of a continuous Time LTI System using Laplace Transform
clear all
clc
syms t a b  m u s 
x=input('Enter the input of the system:');
h=input('Enter the impulse response of the system:');
X=laplace(x);
H=laplace(h);
Y=X*H;
y=simplify(ilaplace(Y));
disp('The Laplace Transform of input function is X:');
disp(X);
disp('The Laplace Transform of impulse response is H:');
disp(H);
disp('The Laplace Transform of output function is Y:');
disp(Y);
disp('The output of the system is y:');
disp(y);
G=(Y/X);
disp('The Transfer function of the system is G(s):');
disp(G);
[n,d]=numden(G);
disp('The denominator of the Transfer function is d:');
disp(d);
p=solve(d);
n=length(p);
disp('The poles of the system is P:');
for i=1:n
    disp(p(i));
    i=i+1;
end
m=0;
u=0;
s=0;
for j=1:n
    if(real(p(j))>0)
        u=u+1;
    end
    j=j+1;
end
if(u>0)
    disp('The system is unstable');
end
for k=1:n
    if(real(p(k))==0)
        m=m+1;
    end
    k=k+1;
end
if(u==0)
    if(m>0)
        disp('The system is marginally stable');
    end
end
if(u==0)
    if(m==0)
        for f=1:n
            if(real(p(f))<0)
                s=s+1;
            end
            f=f+1;
        end
    end
end
if(u==0)
    if(m==0)
        if(s>0)
            disp('The system is stable');
        end
    end
end
for o=1:n
    plot(real(p(o)),[-10,10]);
    hold on
    o=o+1;
end

  

     
       
       
        
   
        
 

    
   


