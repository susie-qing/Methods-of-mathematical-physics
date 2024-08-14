% Step 1: ��ȡ��Ƶ�źţ���path_to_your_file�ĳɴ����Ƶ��Ŀ¼
[signal, Fs] = audioread('D:\path_to_your_file\police.wav');

% ����ź��Ƿ�Ϊ��ͨ����˫ͨ����������ǣ�����ת��Ϊ��ͨ��
[numSamples, numChannels] = size(signal);

if numChannels > 2
    % ����ź��ж��ͨ��������ת��Ϊ��ͨ��
    signal = mean(signal, 2);
elseif numChannels == 2
    % ����ź���˫ͨ�������ֲ���
    % �޸Ľ��ڶ�������ͨ��ʱ����
end

% Step 2: ִ�и���Ҷ�任
N = length(signal);
f = (0:N-1)*(Fs/N);  % ����Ƶ������
signal_fft = fft(signal);

% Step 3: ����ԭʼ�źŵ�Ƶ��ͼ
figure;
subplot(3, 1, 1);
plot(f, abs(signal_fft)/N);
title('ԭʼ�źŵķ���Ƶ��');
xlabel('Ƶ�� (Hz)');
ylabel('����');

% Step 4: �򵥵Ĵ�ͨ�˲��������籣��500 Hz �� 1500 Hz ֮���Ƶ�ʣ�
f_band = [500 1500];  % ��ͨƵ�ʷ�Χ
filter = (f >= f_band(1) & f <= f_band(2)) | (f >= (Fs - f_band(2)) & f <= (Fs - f_band(1)));

% ��ȷ����Գ�Ƶ�ʷ���
signal_fft_filtered = signal_fft;
signal_fft_filtered(~filter) = 0;

% Step 5: �����˲����źŵ�Ƶ��ͼ
subplot(3, 1, 2);
plot(f, abs(signal_fft_filtered)/N);
title('������ͨ�˲�����ķ���Ƶ��');
xlabel('Ƶ�� (Hz)');
ylabel('����');

% Step 6: ִ���渵��Ҷ�任
signal_filtered = ifft(signal_fft_filtered);

% ����渵��Ҷ�任����ź��Ƿ�Ϊʵ����ת��Ϊʵ��
signal_filtered = real(signal_filtered);

% У����˺���ź�Ƶ��
signal_filtered_fft = fft(signal_filtered);
subplot(3, 1, 3);
plot(f, abs(signal_filtered_fft)/N);
title('�渵��Ҷ�任����˲��źŷ���Ƶ��');
xlabel('Ƶ�� (Hz)');
ylabel('����');

% ����ԭʼ�͹��˺���źŽ��жԱ�
disp('����ԭʼ�ź�:');
sound(signal, Fs);
pause(length(signal)/Fs + 2);  % ������ԭʼ�źź���ͣ

disp('���ž�����ͨ�˲�������ź�:');
sound(signal_filtered, Fs);  % ȷ�� signal_filtered ��ʵ������Ϊ��ͨ����˫ͨ��
saveas(gcf,'save.jpg');