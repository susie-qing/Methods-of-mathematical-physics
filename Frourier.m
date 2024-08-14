% Step 1: 读取音频信号，将path_to_your_file改成存放音频的目录
[signal, Fs] = audioread('D:\path_to_your_file\police.wav');

% 检查信号是否为单通道或双通道，如果不是，则将其转换为单通道
[numSamples, numChannels] = size(signal);

if numChannels > 2
    % 如果信号有多个通道，将其转换为单通道
    signal = mean(signal, 2);
elseif numChannels == 2
    % 如果信号是双通道，保持不变
    % 修改仅在多于两个通道时处理
end

% Step 2: 执行傅里叶变换
N = length(signal);
f = (0:N-1)*(Fs/N);  % 构建频率向量
signal_fft = fft(signal);

% Step 3: 绘制原始信号的频谱图
figure;
subplot(3, 1, 1);
plot(f, abs(signal_fft)/N);
title('原始信号的幅度频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

% Step 4: 简单的带通滤波器（例如保留500 Hz 到 1500 Hz 之间的频率）
f_band = [500 1500];  % 带通频率范围
filter = (f >= f_band(1) & f <= f_band(2)) | (f >= (Fs - f_band(2)) & f <= (Fs - f_band(1)));

% 正确处理对称频率分量
signal_fft_filtered = signal_fft;
signal_fft_filtered(~filter) = 0;

% Step 5: 绘制滤波后信号的频谱图
subplot(3, 1, 2);
plot(f, abs(signal_fft_filtered)/N);
title('经过带通滤波器后的幅度频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

% Step 6: 执行逆傅里叶变换
signal_filtered = ifft(signal_fft_filtered);

% 检查逆傅里叶变换后的信号是否为实数，转换为实数
signal_filtered = real(signal_filtered);

% 校验过滤后的信号频谱
signal_filtered_fft = fft(signal_filtered);
subplot(3, 1, 3);
plot(f, abs(signal_filtered_fft)/N);
title('逆傅里叶变换后的滤波信号幅度频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

% 播放原始和过滤后的信号进行对比
disp('播放原始信号:');
sound(signal, Fs);
pause(length(signal)/Fs + 2);  % 播放完原始信号后暂停

disp('播放经过带通滤波器后的信号:');
sound(signal_filtered, Fs);  % 确保 signal_filtered 是实数并且为单通道或双通道
saveas(gcf,'save.jpg');