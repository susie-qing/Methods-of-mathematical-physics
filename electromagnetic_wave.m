% �������
y = linspace(-2*pi, 2*pi, 100);  % y��ķ�Χ
t = linspace(0, 2*pi, 200);  % ʱ�䷶Χ
[tGrid, yGrid] = meshgrid(t, y);
omega = 1;  % ��Ƶ��
k = 1;  % ����
E0 = 1;  % �糡��ֵ
B0 = E0;  % �ų���ֵ��������ڵ糡

% ����糡�ʹų����εĸ�����ʽ
E_complex = E0 * exp(1i * (k * yGrid - omega * tGrid));
B_complex = B0 * exp(1i * (k * yGrid - omega * tGrid));

% ȡʵ�����ڿ��ӻ�
E = real(E_complex);
B = real(B_complex);

% ��������
figure;
axis([-1 1 -2*pi 2*pi -1 1]);  % �����᷶Χ
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('��Ų���������');
view(3);  % ��ʼ�ӽ�
grid on;
hold on;

% �糡�ߺʹų��ߵĳ�ʼ����
hE = plot3(E(:,1), y, zeros(size(E(:,1))), 'r', 'LineWidth', 2); % �糡�ߣ��� x �����𵴣�
hB = plot3(zeros(size(B(:,1))), y, B(:,1), 'b', 'LineWidth', 2); % �ų��ߣ��� z �����𵴣�

% ����ͼ��
legend('�糡��E��', '�ų���B��');

filename = 'electromagnetic_wave_y_direction.gif'; % GIF �ļ���

for i = 1:length(t)
    % ��������
    set(hE, 'XData', E(:,i));
    set(hE, 'YData', y);
    set(hE, 'ZData', zeros(size(E(:,i))));

    set(hB, 'XData', zeros(size(B(:,i))));
    set(hB, 'YData', y);
    set(hB, 'ZData', B(:,i));

    % �����µ��ӽ� (�����ӽǿ���ת30��)
    view(30, 30);

    drawnow;

    % ��׽��ǰ֡
    frame = getframe(gcf);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im, 256);

    % ����һ֡д�� GIF �ļ��������� 'LoopCount' Ϊ Inf ʵ������ѭ��
    if i == 1
        imwrite(imind, cm, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 0.05);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode',...
                'append', 'DelayTime', 0.05);
    end
end

hold off;


