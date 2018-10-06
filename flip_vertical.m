function z = flip_vertical(a)

z = zeros(size(a));
z = uint8(a);

[panjang,lebar,dimensi] = size(a);

for i = 1:panjang-1
    for j = 1:lebar
        for k = 1:dimensi
            z(panjang-i,j,k)=a(i,j,k);
        end
    end
end