# DL-Watermarking
Image watermarking framework powered by convolutional encoder-decoder network

Abstract - The spread of illegal replication of digital image has seriously affected the protection of intellectual property rights. Nowadays, although watermarking is the most popular technology for copyright protection and ownership authentication, most of the current works cannot encounter numerous intentional attacks of watermark destruction. In this research, we introduce a novel framework of blind image watermarking that is able to learn attacking patterns effectively based on a deep convolutional encoder-decoder network. For details, a binary watermark image is hidden into selective wavelet blocks by the mean of an optimal encoding rule, wherein the quality image degradation is minimized over the Mean Square Error metric for a significant image imperceptibility enhancement. Then, the embedding maps, defined as the wavelet coefficient difference values, of various attacks simulated as digital image transformations of the watermarked image are revealed for training the deep learning-based watermark extraction model. Accordingly, the watermark information hidden in an attacked image can be precisely recovered from its embedding map by the trained model. From experimental results, the proposed watermark framework achieves a good performance trade-off between image imperceptibility and watermark robustness through an adjustable embedding strength. In addition, our approach is strongly defeats several state-of-the-art methods in terms of watermark robustness against many critical attacks.

<img src="https://github.com/ThienHuynhThe/DL-Watermarking/blob/master/overall%image%watermarking%framework.png" height="672px" width="1296px" >
<img src="https://github.com/ThienHuynhThe/DL-Watermarking/blob/master/deep%20learning%20for%20watermark%20recovery.png" height="441x" width="1381px" >

T. Huynh-The, C. Hua, N. A. Tu and D. Kim, "Robust Image Watermarking Framework Powered by Convolutional Encoder-Decoder Network," 2019 Digital Image Computing: Techniques and Applications (DICTA), Perth, Australia, 2019, pp. 1-7, doi: 10.1109/DICTA47822.2019.8945866.

@INPROCEEDINGS{8945866,
  author={T. {Huynh-The} and C. {Hua} and N. A. {Tu} and D. {Kim}},
  booktitle={2019 Digital Image Computing: Techniques and Applications (DICTA)}, 
  title={Robust Image Watermarking Framework Powered by Convolutional Encoder-Decoder Network}, 
  year={2019},
  address={Perth, Australia},
  pages={1-7},}
