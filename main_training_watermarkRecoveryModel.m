classes = [
    "bit0"
    "bit1"
    ];
pixelLabelID = [0, 255];


foldername = 'dataset';
labelDir = fullfile(strcat(foldername,'\train\groundtruth'));
pxds = pixelLabelDatastore(labelDir,classes,pixelLabelID);

tbl = countEachLabel(pxds);
frequency = tbl.PixelCount/sum(tbl.PixelCount);
imageFreq = tbl.PixelCount ./ tbl.ImagePixelCount;
classWeights = median(imageFreq) ./ imageFreq;

% read data, including the input and groundtruth, for training model and validating performance
imdsTrain       = imageDatastore(strcat(foldername,'\train\input'));
imdsValidation  = imageDatastore(strcat(foldername,'\test\input'));

pxdsTrain       = pixelLabelDatastore(strcat(foldername,'\train\groundtruth'),classes,pixelLabelID);
pxdsValidation  = pixelLabelDatastore(strcat(foldername,'\test\groundtruth'),classes,pixelLabelID);

numTrainingImages   = numel(imdsTrain.Files);
numValidationImages = numel(imdsValidation.Files);

% build an encoder-decoder network
imageSize = [64 64 3];
numClasses = numel(classes);
lgraph = segnetLayers(imageSize,numClasses,'vgg16');
pxLayer = pixelClassificationLayer('Name','labels','Classes',tbl.Name,'ClassWeights',classWeights)
lgraph = removeLayers(lgraph,'pixelLabels');
lgraph = addLayers(lgraph, pxLayer);
lgraph = connectLayers(lgraph,'softmax','labels');

pximdsTrain 		= pixelLabelImageDatastore(imdsTrain,pxdsTrain);	
pximdsValidation 	= pixelLabelImageDatastore(imdsValidation,pxdsValidation);	

batchsize = 64
nocycle = round(length(imdsTrain.Files)/batchsize)

% Select Training Options
options = trainingOptions('sgdm',...
    'MiniBatchSize',batchsize,...
    'MaxEpochs',30,...  
    'InitialLearnRate',0.01,...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropPeriod',10,...
    'LearnRateDropFactor',0.1,...
    'L2Regularization',0.0005, ...
    'ValidationData',pximdsValidation, ...
    'ValidationFrequency',nocycle,...
    'ValidationPatience',Inf,...
    'Shuffle','every-epoch', ...
    'ExecutionEnvironment','gpu',...
    'VerboseFrequency',nocycle);

trainednet = trainNetwork(pximdsTrain,lgraph,options);

mkdir(foldername,'result')  % create a folder to save the recovered watermark images
pxdsResults = semanticseg(imdsValidation,trainednet,'WriteLocation',strcat(foldername,'\result'),'MiniBatchSize',64,'ExecutionEnvironment','gpu','Verbose',true);

gtruth = dir(strcat(foldername,'\test\groundtruth'));
result = dir(strcat(foldername,'\result')); 
% imwrite the recovered watermark image
for i = 3 : size(result,1)
    J = logical(imread(strcat(result(i).folder,'\',result(i).name))-1);
    imwrite(uint8(J)*255,strcat(result(i).folder,'\',result(i).name),'png');
end

% measure the bit error rate
for i = 3 : size(gtruth,1)
    I = logical(imread(strcat(gtruth(i).folder,'\',gtruth(i).name))/255);
    J = logical(imread(strcat(result(i).folder,'\',result(i).name))/255);
    C = xor(I,J);
    ber(i-2,1) = sum(sum(C))/(64^2);
end
mean(ber)




