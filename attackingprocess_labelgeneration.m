function ImageAttackedStructure = attackingprocess_labelgeneration(wmark,filename,locationLabel)
%     label = round(wmark/255);
    label = wmark;
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0010.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0020.png'),'png')
    
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0030.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0031.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0032.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0033.png'),'png')
    
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0040.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0041.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0042.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0043.png'),'png')
    
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0050.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0051.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0052.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0053.png'),'png')
    
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0060.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0061.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0062.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0063.png'),'png')

    imwrite(label,strcat(locationLabel,filename(1:end-4),'0070.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0071.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0072.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0073.png'),'png')

    imwrite(label,strcat(locationLabel,filename(1:end-4),'0090.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0091.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0092.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0093.png'),'png')

    imwrite(label,strcat(locationLabel,filename(1:end-4),'0100.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0101.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0102.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0103.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0104.png'),'png')
    
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0110.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0111.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0112.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0113.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0114.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0115.png'),'png')
    
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0120.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0121.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0122.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0123.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0124.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0125.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0126.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0127.png'),'png')
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0128.png'),'png')
    
%     label = round(imrotate(wmark,10,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'019.png'),'png')
%     
%     label = round(imrotate(wmark,20,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'020.png'),'png')
%     
%     label = round(imrotate(wmark,30,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'021.png'),'png')
%     
%     label = round(imrotate(wmark,40,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'022.png'),'png')
%     
%     label = round(imrotate(wmark,50,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'023.png'),'png')
%  
%     label = round(imrotate(wmark,60,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'024.png'),'png')
%     
%     label = round(imrotate(wmark,70,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'025.png'),'png')
%     
%     label = round(imrotate(wmark,80,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'026.png'),'png')
%     
%     label = round(imrotate(wmark,90,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'027.png'),'png')
%     
%     label = round(imrotate(wmark,100,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'028.png'),'png')
%     
%     label = round(imrotate(wmark,110,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'029.png'),'png')
%     
%     label = round(imrotate(wmark,120,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'030.png'),'png')
%     
%     label = round(imrotate(wmark,130,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'031.png'),'png')
%     
%     label = round(imrotate(wmark,140,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'032.png'),'png')
%     
%     label = round(imrotate(wmark,150,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'033.png'),'png')
%     
%     label = round(imrotate(wmark,160,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'034.png'),'png')
%    
%     label = round(imrotate(wmark,170,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'035.png'),'png')
%     
%     label = round(imrotate(wmark,180,'nearest','crop'));
%     imwrite(label,strcat(locationLabel,filename(1:end-4),'036.png'),'png')
    
    label = round(imrotate(wmark,1,'nearest','crop'));
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0080.png'),'png')
    
    label = round(imrotate(wmark,2,'nearest','crop'));
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0081.png'),'png')
    
    label = round(imrotate(wmark,3,'nearest','crop'));
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0082.png'),'png')
    
    label = round(imrotate(wmark,4,'nearest','crop'));
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0083.png'),'png')
    
    label = round(imrotate(wmark,5,'nearest','crop'));
    imwrite(label,strcat(locationLabel,filename(1:end-4),'0084.png'),'png')

    ImageAttackedStructure = [];
end
 
function numberintext = numbering(k)
    if k <= 9
        numberintext = strcat('00',num2str(k));
    elseif k <= 99
        numberintext = strcat('0',num2str(k));
    end
end

