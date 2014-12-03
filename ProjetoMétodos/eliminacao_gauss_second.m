function [A,b] = eliminacao_gauss_second( A, b)

[linha, coluna] = size(A);
n = linha
for j = 1 :n-2
    for i = j+1 : n
        m = A(i,j)/A(j,j);
        
        for k = 1 : n
            A(i,k) = A(i,k) - (m*(A(j,k)));
        end
        
    end
    b(i) = b(i)-(m*b(j));

end

end