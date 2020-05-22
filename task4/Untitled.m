clear all

I = imread('dragon.png'); %opens image

figure(1);
image(I);

[x,y,z] = size(I);

%LeftRightTopBottom
J = zeros(size(I));
r = 1;

tic
for a = 1:x
    for b = 1:y
        count = 0;
        for i = -r:r
            for j = -r:r
                if (i == 0 || j == 0) && (a + i > 0 && b + j > 0) && (a + i < x+1 && b + j < y+1)
                    J(a,b,:) = J(a,b,:) + double(I(a+i,b+j,:));
                    count = count + 1;
                end
            end
        end
        J(a,b,:) = J(a,b,:) / count;
    end
end
toc

figure(2);
image(uint8(J)); %displays image

%8Surrounding
K = zeros(size(I));
r = 1;

tic
for a = 1:x
    for b = 1:y
        count = 0;
        for i = -r:r
            for j = -r:r
                if (a + i > 0 && b + j > 0) && (a + i < x+1 && b + j < y+1)
                    K(a,b,:) = K(a,b,:) + double(I(a+i,b+j,:));
                    count = count + 1;
                end
            end
        end
        K(a,b,:) = K(a,b,:) / count;
    end
end
toc

figure(3);
image(uint8(K)); %displays image

%24surrounding
L = zeros(size(I));
r = 2;

tic
for a = 1:x
    for b = 1:y
        count = 0;
        for i = -r:r
            for j = -r:r
                if (a + i > 0 && b + j > 0) && (a + i < x+1 && b + j < y+1)
                    L(a,b,:) = L(a,b,:) + double(I(a+i,b+j,:));
                    count = count + 1;
                end
            end
        end
        L(a,b,:) = L(a,b,:) / count;
    end
end
toc

figure(4);
image(uint8(L)); %displays image

%24surroundingweighted
M = zeros(size(I));
r = 2;

tic
for a = 1:x
    for b = 1:y
        count = 0;
        for i = -r:r
            for j = -r:r
                if (a + i > 0 && b + j > 0) && (a + i < x+1 && b + j < y+1)
                    if (i == 2 || j == 2) || (i == -2 || j == -2)
                        M(a,b,:) = M(a,b,:) + 0.125*double(I(a+i,b+j,:));
                        count = count + 0.125;
                    elseif (i == 1 || j == 1) || (i == -1 || j == -1)
                        M(a,b,:) = M(a,b,:) + 0.25*double(I(a+i,b+j,:));
                        count = count + 0.25;
                    else
                        M(a,b,:) = M(a,b,:) + 0.5*double(I(a+i,b+j,:));
                        count = count + 0.5;
                    end
                end
            end
        end
        M(a,b,:) = M(a,b,:) / count;
    end
end
toc

figure(5);
image(uint8(M)); %displays image


%=========================================================================
%=========================================================================
%=========================================================================
%============================LESS FOR LOOPS===============================
%=========================================================================
%=========================================================================
%=========================================================================
%these ones will have black borders cause screw it

I = im2double(I);

%LeftRightTopBottom
N = zeros(size(I));
r = 1;

tic
rows = 1+r:x-r;
cols = 1+r:y-r;
N(rows,cols,:) = (I(rows,cols,:) + I(rows,cols+1,:) + I(rows,cols-1,:) + I(rows+1,cols,:) + I(rows-1,cols,:))/5;
toc

figure(6);
N = im2uint8(N);
image(uint8(N)); %displays image

%8Surrounding
O = zeros(size(I));
r = 1;

tic
rows = 1+r:x-r;
cols = 1+r:y-r;
O(rows,cols,:) = (I(rows,cols,:) + I(rows,cols+1,:) + I(rows,cols-1,:) + I(rows+1,cols,:) + I(rows+1,cols+1,:) + I(rows+1,cols-1,:) + I(rows-1,cols,:) + I(rows-1,cols-1,:) + I(rows-1,cols+1,:))/9;
toc

figure(7);
O = im2uint8(O);
image(uint8(O)); %displays image

%24surrounding
P = zeros(size(I));
r = 2;

tic
rows = 1+r:x-r;
cols = 1+r:y-r;
P(rows,cols,:) = (I(rows-2,cols-2,:) + I(rows-2,cols-1,:) + I(rows-2,cols,:) + I(rows-2,cols+1,:) + I(rows-2,cols+2,:) + I(rows-1,cols-2,:) + I(rows-1,cols-1,:) + I(rows-1,cols,:) + I(rows-1,cols+1,:) + I(rows-1,cols+2,:) + I(rows,cols-2,:) + I(rows,cols-1,:) + I(rows,cols,:) + I(rows,cols+1,:) + I(rows,cols+2,:) + I(rows+1,cols-2,:) + I(rows+1,cols-1,:) + I(rows+1,cols,:) + I(rows+1,cols+1,:) + I(rows+1,cols+2,:) + I(rows+2,cols-2,:) + I(rows+2,cols-1,:) + I(rows+2,cols,:) + I(rows+2,cols+1,:) + I(rows+2,cols+2,:))/25;
toc

figure(8);
P = im2uint8(P);
image(uint8(P)); %displays image

%24surroundingweighted
Q = zeros(size(I));
r = 2;

tic
rows = 1+r:x-r;
cols = 1+r:y-r;
Q(rows,cols,:) = (0.125*I(rows-2,cols-2,:) + 0.125*I(rows-2,cols-1,:) + 0.125*I(rows-2,cols,:) + 0.125*I(rows-2,cols+1,:) + 0.125*I(rows-2,cols+2,:) + 0.125*I(rows-1,cols-2,:) + 0.25*I(rows-1,cols-1,:) + 0.25*I(rows-1,cols,:) + 0.25*I(rows-1,cols+1,:) + 0.125*I(rows-1,cols+2,:) + 0.125*I(rows,cols-2,:) + 0.25*I(rows,cols-1,:) + 0.5*I(rows,cols,:) + 0.25*I(rows,cols+1,:) + 0.125*I(rows,cols+2,:) + 0.125*I(rows+1,cols-2,:) + 0.25*I(rows+1,cols-1,:) + 0.25*I(rows+1,cols,:) + 0.25*I(rows+1,cols+1,:) + 0.125*I(rows+1,cols+2,:) + 0.125*I(rows+2,cols-2,:) + 0.125*I(rows+2,cols-1,:) + 0.125*I(rows+2,cols,:) + 0.125*I(rows+2,cols+1,:) + 0.125*I(rows+2,cols+2,:))/4.5;
toc

figure(9);
Q = im2uint8(Q);
image(uint8(Q)); %displays image