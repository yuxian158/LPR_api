filename='1.jpg';
fid=fopen(filename);
img_source=fread(fid);fclose(fid);
imageBase64=matlab.net.base64encode(uint8(img_source));
request_url='http://********:7443/items/';
headers = {'Content-Type' 'application/json'};
field = 'image';
data=struct(field, string(imageBase64));
options = weboptions("RequestMethod","post","HeaderFields",headers);  % post
data=webwrite(request_url,data,options);
res=data{1,1}{1};
disp(res);
position=data{1,1}{3};
img=imread(filename);
ls=[position(1,1)+10,position(2,1),position(3,1)-position(1,1)+5,position(4,1)-position(2,1)+1];
X2 = imcrop(img,ls);
imshow(X2);
