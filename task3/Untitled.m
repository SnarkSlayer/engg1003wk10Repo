I = imread('image.jpg'); %opens image.jpg

i = I(1:10:end, 1:10:end, :); %resizes the image

image(i); %displays the image