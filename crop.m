function z = crop(a)
z = zeros(size(a));
z = uint8(a);

z = a(100:500,200:400,:);