function ImageAttackedStructure=attackingprocess_datageneration(output,filename,locationImage,block)
%% NON-ATTACK

% replace extract_deltaImg by extract_aiBlueImg
img_deltaB = extract_deltaImg(output,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0010.png'),'png')
%% HISTOGRAM EQUALIZATION
ImageAttackedStructure =[];
OutputHistEq=histeq(output);
img_deltaB = extract_deltaImg(OutputHistEq,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0020.png'),'png')
 
%% MEDIAN FILTERING WITH DIFFERNET SIZES OF MASK
 
n=3;
for i=1:1
    OutputMedFilt3(:,:,i)=medfilt2(output(:,:,i),[n n]);
end
img_deltaB = extract_deltaImg(OutputMedFilt3,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0030.png'),'png')
 
n=5;
for i=1:1
    OutputMedFilt5(:,:,i)=medfilt2(output(:,:,i),[n n]);
end
img_deltaB = extract_deltaImg(OutputMedFilt5,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0031.png'),'png')
 
n=7;
for i=1:1
    OutputMedFilt7(:,:,i)=medfilt2(output(:,:,i),[n n]);
end
img_deltaB = extract_deltaImg(OutputMedFilt7,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0032.png'),'png')

n=9;
for i=1:1
    OutputMedFilt7(:,:,i)=medfilt2(output(:,:,i),[n n]);
end
img_deltaB = extract_deltaImg(OutputMedFilt7,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0033.png'),'png')
 
 
%% AVERAGE FILTERING WITH DIFFERENT SIZES OF MASK
 
n=3;h=fspecial('average',n);
OutputAver3=imfilter(output,h,'replicate');
img_deltaB = extract_deltaImg(OutputAver3,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0040.png'),'png')
 
n=5;h=fspecial('average',n);
OutputAver5=imfilter(output,h,'replicate');
img_deltaB = extract_deltaImg(OutputAver5,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0041.png'),'png')
 
n=7;h=fspecial('average',n);
OutputAver7=imfilter(output,h,'replicate');
img_deltaB = extract_deltaImg(OutputAver7,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0042.png'),'png')

n=9;h=fspecial('average',n);
OutputAver7=imfilter(output,h,'replicate');
img_deltaB = extract_deltaImg(OutputAver7,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0043.png'),'png')
 
 
%% GAUSSIAN FILTERING WITH DIFFERENT SIZES OF MASK
 
n=3;h=fspecial('gaussian',[n n]);
OutputGaus3=imfilter(output,h,'replicate');
img_deltaB = extract_deltaImg(OutputGaus3,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0050.png'),'png')
 
n=5;h=fspecial('gaussian',[n n]);
OutputGaus5=imfilter(output,h,'replicate');
img_deltaB = extract_deltaImg(OutputGaus5,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0051.png'),'png')
 
n=7;h=fspecial('gaussian',[n n]);
OutputGaus7=imfilter(output,h,'replicate');
img_deltaB = extract_deltaImg(OutputGaus7,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0052.png'),'png')

n=9;h=fspecial('gaussian',[n n]);
OutputGaus7=imfilter(output,h,'replicate');
img_deltaB = extract_deltaImg(OutputGaus7,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0053.png'),'png')
 
 
%% MOTION BLURRING 
 
len=3;theta=0;h=fspecial('motion',len,theta);
OutputBlur03=imfilter(output,h);
img_deltaB = extract_deltaImg(OutputBlur03,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0060.png'),'png')
 
len=5;theta=0;h=fspecial('motion',len,theta);
OutputBlur05=imfilter(output,h);
img_deltaB = extract_deltaImg(OutputBlur05,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0061.png'),'png')
 
len=7;theta=0;h=fspecial('motion',len,theta);
OutputBlur07=imfilter(output,h);
img_deltaB = extract_deltaImg(OutputBlur07,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0062.png'),'png')

len=9;theta=0;h=fspecial('motion',len,theta);
OutputBlur07=imfilter(output,h);
img_deltaB = extract_deltaImg(OutputBlur07,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0063.png'),'png')
 
%% SCALING TO 2 AND 0.5
 
OutputScale200=imresize(imresize(output,2),0.5);
img_deltaB = extract_deltaImg(OutputScale200,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0070.png'),'png')
 
OutputScale400=imresize(imresize(output,4),0.25);
img_deltaB = extract_deltaImg(OutputScale400,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0071.png'),'png')
 
OutputScale050=imresize(imresize(output,0.5),2);
img_deltaB = extract_deltaImg(OutputScale050,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0072.png'),'png')
 
OutputScale025=imresize(imresize(output,0.25),4);
img_deltaB = extract_deltaImg(OutputScale025,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0073.png'),'png')
 
%% ROTATION WITH 0.5/2/5
 
% OutputRot010=imrotate(output,10,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot010,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'019.png'),'png')
%  
% OutputRot020=imrotate(output,20,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot020,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'020.png'),'png')
%  
% OutputRot030=imrotate(output,30,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot030,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'021.png'),'png')
%  
% OutputRot040=imrotate(output,40,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot040,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'022.png'),'png')
%  
% OutputRot050=imrotate(output,50,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot050,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'023.png'),'png')
%  
% OutputRot060=imrotate(output,60,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot060,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'024.png'),'png')
%  
% OutputRot070=imrotate(output,70,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot070,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'025.png'),'png')
%  
% OutputRot080=imrotate(output,80,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot080,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'026.png'),'png')
%  
% OutputRot090=imrotate(output,90,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot090,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'027.png'),'png')
%  
% OutputRot100=imrotate(output,100,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot100,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'028.png'),'png')
%  
% OutputRot110=imrotate(output,110,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot110,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'029.png'),'png')
%  
% OutputRot120=imrotate(output,120,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot120,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'030.png'),'png')
%  
% OutputRot130=imrotate(output,130,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot130,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'031.png'),'png')
%  
% OutputRot140=imrotate(output,140,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot140,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'032.png'),'png')
%  
% OutputRot150=imrotate(output,150,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot150,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'033.png'),'png')
%  
% OutputRot160=imrotate(output,160,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot160,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'034.png'),'png')
%  
% OutputRot170=imrotate(output,170,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot170,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'035.png'),'png')
%  
% OutputRot180=imrotate(output,180,'nearest','crop');
% img_deltaB = extract_deltaImg(OutputRot180,block);
% imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'036.png'),'png')

OutputRot=imrotate(output,1,'nearest','crop');
img_deltaB = extract_deltaImgOrientation(OutputRot,block,1);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0080.png'),'png')

OutputRot=imrotate(output,2,'nearest','crop');
img_deltaB = extract_deltaImgOrientation(OutputRot,block,2);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0081.png'),'png')

OutputRot=imrotate(output,3,'nearest','crop');
img_deltaB = extract_deltaImgOrientation(OutputRot,block,3);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0082.png'),'png')

OutputRot=imrotate(output,4,'nearest','crop');
img_deltaB = extract_deltaImgOrientation(OutputRot,block,4);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0083.png'),'png')

OutputRot=imrotate(output,5,'nearest','crop');
img_deltaB = extract_deltaImgOrientation(OutputRot,block,5);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0084.png'),'png')


%% CROPPING WITH 1.5625/6.25/25
 
OutputCrop3232=output;
OutputCrop3232(240:271,240:271,:)=0;
img_deltaB = extract_deltaImg(OutputCrop3232,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0090.png'),'png')
 
OutputCrop6432=output;
OutputCrop6432(225:288,240:271,:)=0;
img_deltaB = extract_deltaImg(OutputCrop6432,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0091.png'),'png')
 
OutputCrop3264=output;
OutputCrop3264(240:271,225:288,:)=0;
img_deltaB = extract_deltaImg(OutputCrop3264,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0092.png'),'png')
 
OutputCrop6464=output;
OutputCrop6464(225:288,225:288,:)=0;
img_deltaB = extract_deltaImg(OutputCrop6464,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0093.png'),'png')
 
%% GAUSSIAN NOISE
 
OutputGNoise=imnoise(output,'gaussian',0,0.001);
img_deltaB = extract_deltaImg(OutputGNoise,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0100.png'),'png')
 
OutputGNoise=imnoise(output,'gaussian',0,0.002);
img_deltaB = extract_deltaImg(OutputGNoise,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0101.png'),'png')
 
OutputGNoise=imnoise(output,'gaussian',0,0.003);
img_deltaB = extract_deltaImg(OutputGNoise,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0102.png'),'png')
 
OutputGNoise=imnoise(output,'gaussian',0,0.005);
img_deltaB = extract_deltaImg(OutputGNoise,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0103.png'),'png')
 
OutputGNoise=imnoise(output,'gaussian',0,0.01);
img_deltaB = extract_deltaImg(OutputGNoise,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0104.png'),'png')
 
%% SALT&PEPPER NOISE
 
OutputSaltPepper=imnoise(output,'salt & pepper',0.001);
img_deltaB = extract_deltaImg(OutputSaltPepper,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0110.png'),'png')
 
OutputSaltPepper=imnoise(output,'salt & pepper',0.002);
img_deltaB = extract_deltaImg(OutputSaltPepper,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0111.png'),'png')
 
OutputSaltPepper=imnoise(output,'salt & pepper',0.005);
img_deltaB = extract_deltaImg(OutputSaltPepper,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0112.png'),'png')
 
OutputSaltPepper=imnoise(output,'salt & pepper',0.01);
img_deltaB = extract_deltaImg(OutputSaltPepper,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0113.png'),'png')
 
OutputSaltPepper=imnoise(output,'salt & pepper',0.02);
img_deltaB = extract_deltaImg(OutputSaltPepper,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0114.png'),'png')
 
OutputSaltPepper=imnoise(output,'salt & pepper',0.05);
img_deltaB = extract_deltaImg(OutputSaltPepper,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0115.png'),'png')
 
%% JPEG COMPRESSION WITH DIFFERENT LEVEL
imwrite(output,'outputjpeg.jpg','jpg','mode','lossy','Quality',10);
OutputJPEG10=imread('outputjpeg.jpg');
img_deltaB = extract_deltaImg(OutputJPEG10,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0120.png'),'png')
 
imwrite(output,'outputjpeg.jpg','jpg','mode','lossy','Quality',20);
OutputJPEG20=imread('outputjpeg.jpg');
img_deltaB = extract_deltaImg(OutputJPEG20,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0121.png'),'png')
 
imwrite(output,'outputjpeg.jpg','jpg','mode','lossy','Quality',30);
OutputJPEG30=imread('outputjpeg.jpg');
img_deltaB = extract_deltaImg(OutputJPEG30,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0122.png'),'png')
 
imwrite(output,'outputjpeg.jpg','jpg','mode','lossy','Quality',40);
OutputJPEG40=imread('outputjpeg.jpg');
img_deltaB = extract_deltaImg(OutputJPEG40,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0123.png'),'png')
 
imwrite(output,'outputjpeg.jpg','jpg','mode','lossy','Quality',50);
OutputJPEG50=imread('outputjpeg.jpg');
img_deltaB = extract_deltaImg(OutputJPEG50,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0124.png'),'png')
 
imwrite(output,'outputjpeg.jpg','jpg','mode','lossy','Quality',60);
OutputJPEG60=imread('outputjpeg.jpg');
img_deltaB = extract_deltaImg(OutputJPEG60,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0125.png'),'png')
 
imwrite(output,'outputjpeg.jpg','jpg','mode','lossy','Quality',70);
OutputJPEG70=imread('outputjpeg.jpg');
img_deltaB = extract_deltaImg(OutputJPEG70,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0126.png'),'png')
 
imwrite(output,'outputjpeg.jpg','jpg','mode','lossy','Quality',80);
OutputJPEG80=imread('outputjpeg.jpg');
img_deltaB = extract_deltaImg(OutputJPEG80,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0127.png'),'png')
 
imwrite(output,'outputjpeg.jpg','jpg','mode','lossy','Quality',90);
OutputJPEG90=imread('outputjpeg.jpg');
img_deltaB = extract_deltaImg(OutputJPEG90,block);
imwrite(gray2rgb(img_deltaB),strcat(locationImage,filename(1:end-4),'0128.png'),'png')
 
 
end



