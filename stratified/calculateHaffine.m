V1a = [242 1534 1];
V1b = [1094 263 1];
V2a = [41 449 1];
V2b = [450 58 1];

H1a = V1b;
H1b = V2b;
H2a = [1029 1354 1];
H2b = [123 883 1];

V1 = cross(V1a,V1b);
V1 = V1./V1(3); 
V2 = cross(V2a,V2b)
V2 = V2./V2(3); 
H1 = cross(H1a,H1b)
H1 = H1./H1(3); 
H2 = cross(H2a,H2b)
H2 = H2./H2(3); 

for (x=1:1107),
     y=-round((V1(1)*x+V1(3))/V1(2));
     if(y>0 && y<1662)
         plot(x,y,'*');
     end;
end;

P1 = cross(V1,V2);
P2 = cross(H1,H2);

H1 = cross (P1,P2);
H1 = H1./H1(3)


im = imread('tiles.jpg');
imshow(im);
figure

H = [1 0 0; 0 1 0; 0 0 0];
H(3,1) = H1(1);
H(3,2) = H1(2);
H(3,3) = H1(3);

H = H./H(3,3)
H*transpose(H1)

imNew = im;
for(i=1:1662),
    for(j=1:1107),
        for(k=1:3),
            imNew(i,j,k) = 0;
        end;
    end;
end;

for(i=1:1662),
    for(j=1:1107),
        a = inv(H)*transpose([i j 1]);
        a = round(a./a(3));
        if(a(1)<=1662),
            if(a(2)<=1107),
                imNew(i,j,1) = im(a(1),a(2),1);
                imNew(i,j,2) = im(a(1),a(2),2);
                imNew(i,j,3) = im(a(1),a(2),3);
            end;
        end;
    end;
end;
imshow(imNew);



