function z = flip_horizontal(a)

z = zeros(size(a));
z = uint8(a);

[panjang,lebar,dimensi] = size(a);

for i = 1:panjang
    for j = 1:lebar-1
        for k = 1:dimensi
            z(i,lebar-j,k)=a(i,j,k);
        end
    end
end