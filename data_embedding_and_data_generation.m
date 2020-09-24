% This code is regard to the following paper 
% Thien Huynh-The, Cam-Hao Hua, Nguyen Anh Tu, Dong-Seong Kim, "Robust Image Watermarking Framework Powered by Convolutional Encoder-Decoder Network," 
% 2019 International Conference on Digital Image Computing: Techniques and Applications (DICTA), Perth, Australia, Dec. 2-4, 2019, pp. 1-7.

% Warning: This code will take time to generate a large amount of data.
% MATLAB version R2019a (or higher)

% general configuration
wtype='haar';               % identify the wavelet familar for decomposition
wmark = imread('w.bmp');    % read the watermark image
nbit1 = sum(sum(wmark/255));
nbit0 = 64^2 - nbit1;
lambda = 40                 % embedding strength

foldername = 'dataset';   % create the folder for storage dataset
mkdir(foldername,'train\input')
mkdir(foldername,'train\groundtruth')

%% Generate data for training 
listing = dir('bossDatabase\imgset');   % read the dataset of 10,000 host gray-scale images
% create a variable for the storage of key
key = zeros(4096,2,size(listing,1)-2);
for idx = 3 : size(listing,1)
    input = imread(strcat(listing(idx).folder,'\',listing(idx).name));
    filename = listing(idx).name;
    
    % generate variable for the storage of wavelet coefficients
    coelv01 = zeros(256,256,4);
    [coelv01(:,:,1),coelv01(:,:,2),coelv01(:,:,3),coelv01(:,:,4)]=dwt2(double(input),wtype);

    coelv02 = zeros(128,128,4);
    [coelv02(:,:,1),coelv02(:,:,2),coelv02(:,:,3),coelv02(:,:,4)]=dwt2(coelv01(:,:,1),wtype);

    coelv03 = zeros(64,64,4);
    [coelv03(:,:,1),coelv03(:,:,2),coelv03(:,:,3),coelv03(:,:,4)]=dwt2(coelv02(:,:,1),wtype);

    lh = coelv03(:,:,2);
    hl = coelv03(:,:,3);
    
    % calculate the difference between cH and cV in every blocks
    lh_array = lh(:);
    hl_array = hl(:);
    delta = abs(lh_array-hl_array);
    
    % sort the difference value with larger values for 1-bit embedding and
    % smaller values for 1-bit embedding
    [delta_sort,index] = sort(delta);
    key(:,1,idx-2) = index;     % storage the position blocks as key
    
    % identify the upper and lower thresholds
    [low,up] = calThreshold(delta_sort, lambda);
    
    % perform the embedding process
    ii = 1;
    jj = nbit0 + 1;
    w_array = wmark(:);
    for i = 1 : 4096
            if w_array(i,1) == 255
                m = delta_sort(jj);
                if m < up 
                    if lh_array(index(jj)) >= hl_array(index(jj))
                        lh_array(index(jj)) = lh_array(index(jj)) + (up - m)/2;
                        hl_array(index(jj)) = hl_array(index(jj)) - (up - m)/2;
                    else
                        lh_array(index(jj)) = lh_array(index(jj)) - (up - m)/2;
                        hl_array(index(jj)) = hl_array(index(jj)) + (up - m)/2;
                    end
                end
                check(i,1) = abs(lh_array(index(jj))-hl_array(index(jj)));
                key(i,2,idx-2) = jj;
                jj = jj + 1;
                
            else
                m = delta_sort(ii);
                if m > low 
                    if lh_array(index(ii)) >= hl_array(index(ii))
                        lh_array(index(ii)) = lh_array(index(ii)) - (up - m)/2;
                        hl_array(index(ii)) = hl_array(index(ii)) + (up - m)/2;
                    else
                        lh_array(index(ii)) = lh_array(index(ii)) + (up - m)/2;
                        hl_array(index(ii)) = hl_array(index(ii)) - (up - m)/2;
                    end
                end
                check(i,1) = abs(lh_array(index(ii))-hl_array(index(ii)));
                key(i,2,idx-2) = ii;
                ii = ii + 1;
            end
    end
    
    % reconstruct the image from modified wavelet coefficients
    lh_new = reshape(lh_array,64,64);
    hl_new = reshape(hl_array,64,64);
    coelv03(:,:,2) = lh_new;
    coelv03(:,:,3) = hl_new;
    
    coelv02(:,:,1)=idwt2(coelv03(:,:,1),coelv03(:,:,2),coelv03(:,:,3),coelv03(:,:,4),wtype);
    coelv01(:,:,1)=idwt2(coelv02(:,:,1),coelv02(:,:,2),coelv02(:,:,3),coelv02(:,:,4),wtype);
    output = idwt2(coelv01(:,:,1),coelv01(:,:,2),coelv01(:,:,3),coelv01(:,:,4),wtype);
    output = uint8(output);     % this is the host image after embedding
    
    % set the address to save data of watermark for traning DL model 
    locationImage = strcat(foldername,'\train\input\');
    locationLabel = strcat(foldername,'\train\groundtruth\');
    
    % create the attacking simulation (generating encoding maps in the paper)
    % the following function will 
    % (1) perform image transformation (or attacking) such as blurring, filtering, rotating, scaling... on the host watermarked image
    % (2) extract the encoding map from the host attacked-watermarked image
    % (3) storage of the encoding map as watermark data for training
    attackingprocess_datageneration(output,listing(idx).name,locationImage,key(:,:,idx-2));
    % generating groundtruth corresponsing to encoding maps of attacked images
    attackingprocess_labelgeneration(wmark,filename,locationLabel);
    % measure the psnr between the input host image and the output host watermarked image
    psnrResult(idx-2,1) = psnr(input,output);
end
mean(psnrResult)


%% Generate data for testing or performance validation

mkdir(foldername,'test\input')
mkdir(foldername,'test\groundtruth')

listing = dir('OriginalColorImage');    % read the dataset of 60 host color images
key = zeros(4096,2,size(listing,1)-2);
% This process is similar to the training data generation
for idx = 3 : size(listing,1)
    input = imread(strcat(listing(idx).folder,'\',listing(idx).name));
    input = rgb2gray(input);        % convert from rgb to gray-scale
    filename = listing(idx).name;
    
    coelv01 = zeros(256,256,4);
    [coelv01(:,:,1),coelv01(:,:,2),coelv01(:,:,3),coelv01(:,:,4)]=dwt2(double(input),wtype);

    coelv02 = zeros(128,128,4);
    [coelv02(:,:,1),coelv02(:,:,2),coelv02(:,:,3),coelv02(:,:,4)]=dwt2(coelv01(:,:,1),wtype);

    coelv03 = zeros(64,64,4);
    [coelv03(:,:,1),coelv03(:,:,2),coelv03(:,:,3),coelv03(:,:,4)]=dwt2(coelv02(:,:,1),wtype);


    lh = coelv03(:,:,2);
    hl = coelv03(:,:,3);
    
    
    lh_array = lh(:);
    hl_array = hl(:);
    
    delta = abs(lh_array-hl_array);
    
    [delta_sort,index] = sort(delta);
    key(:,1,idx-2) = index;

    [low,up] = calThreshold(delta_sort, lambda);
    
    ii = 1;
    jj = nbit0+1;
    w_array = wmark(:);
   
    for i = 1 : 4096
            if w_array(i,1) == 255
                m = delta_sort(jj);
                if m < up 
                    if lh_array(index(jj)) >= hl_array(index(jj))
                        lh_array(index(jj)) = lh_array(index(jj)) + (up - m)/2;
                        hl_array(index(jj)) = hl_array(index(jj)) - (up - m)/2;
                    else
                        lh_array(index(jj)) = lh_array(index(jj)) - (up - m)/2;
                        hl_array(index(jj)) = hl_array(index(jj)) + (up - m)/2;
                    end
                end
                check(i,1) = abs(lh_array(index(jj))-hl_array(index(jj)));
                key(i,2,idx-2) = jj;
                jj = jj + 1;
                
            else
                m = delta_sort(ii);
                if m > low 
                    if lh_array(index(ii)) >= hl_array(index(ii))
                        lh_array(index(ii)) = lh_array(index(ii)) - (up - m)/2;
                        hl_array(index(ii)) = hl_array(index(ii)) + (up - m)/2;
                    else
                        lh_array(index(ii)) = lh_array(index(ii)) + (up - m)/2;
                        hl_array(index(ii)) = hl_array(index(ii)) - (up - m)/2;
                    end
                end
                check(i,1) = abs(lh_array(index(ii))-hl_array(index(ii)));
                key(i,2,idx-2) = ii;
                ii = ii + 1;
                
            end
    end
    
    lh_new = reshape(lh_array,64,64);
    hl_new = reshape(hl_array,64,64);
    coelv03(:,:,2) = lh_new;
    coelv03(:,:,3) = hl_new;
    
    coelv02(:,:,1)=idwt2(coelv03(:,:,1),coelv03(:,:,2),coelv03(:,:,3),coelv03(:,:,4),wtype);
    coelv01(:,:,1)=idwt2(coelv02(:,:,1),coelv02(:,:,2),coelv02(:,:,3),coelv02(:,:,4),wtype);
    output = idwt2(coelv01(:,:,1),coelv01(:,:,2),coelv01(:,:,3),coelv01(:,:,4),wtype);
    
    output = uint8(output);
    
    locationImage = strcat(foldername,'\test\input\');
    locationLabel = strcat(foldername,'\test\groundtruth\');
    
    attackingprocess_datageneration(output,listing(idx).name,locationImage,key(:,:,idx-2));
    attackingprocess_labelgeneration(wmark,filename,locationLabel);

    psnrResult(10002+idx,1) = psnr(input,output);
    ssimResult(10002+idx,1) = ssim(input,output);
end
mean(psnrResult)
save(strcat(foldername,'_psnr.mat'),'psnrResult');

