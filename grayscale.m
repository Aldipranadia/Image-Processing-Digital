function z = grayscale(a)
z = zeros(size(a));
z = uint8(a);

z = 0.297*a(:,:,1) + 0.275*a(:,:,2) + 0.141*a(:,:,3);