function z = rotate(a)
z = zeros(size(a));
z = uint8(a);

[panjang,lebar,dimensi] = size(a);

for i=1:panjang
    for j=1:lebar
        for k=1:dimensi
            z(j,i,k) = a(i,j,k);
        end
    end
end