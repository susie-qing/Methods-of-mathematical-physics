% ��������
figure;    % ������ͼ�δ���
hold on;   % ������ͬһͼ���ϻ��ƶ��ͼ��
axis equal;  % ʹ������������
xlabel('ʵ��');
ylabel('�鲿');
title('������·��R��L��C����λ��ϵ');
grid on;

% ����ϵ����
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);

% ���Ƶ�λԲ
theta = linspace(0, 2*pi, 100);
plot(cos(theta), sin(theta), 'k--');  % ������λԲ

% ��������
plot([0 1], [0 0], 'r', 'LineWidth', 2);  % ���� R ����Ϊʵ���ϵ�һ������
text(1.1, 0, 'R', 'Color', 'r', 'FontSize', 12);  % ��ǵ��� R

% ���������ʹ�� i��L����������
omegaL = 1;  % ���� ��L=1
plot([0 0], [0 omegaL], 'g', 'LineWidth', 2);  % ��� L ����Ϊ�����ϵ�һ������
text(0, omegaL + 0.1, 'i��L', 'Color', 'g', 'FontSize', 12);  % ��� i��L

% ����������ʹ�� -i/(��C)���ظ�����
omegaC = 1;  % ���� 1/(��C)=1
plot([0 0], [0 -omegaC], 'b', 'LineWidth', 2);  % ���� C ����Ϊ�������ϵ�һ������
text(0, -omegaC - 0.1, '-i/��C', 'Color', 'b', 'FontSize', 12);  % ��� -i/��C

% ���Ƽ�ͷ
quiver(0, 0, 1, 0, 'r', 'MaxHeadSize', 0.5, 'LineWidth', 2);  % R ������ͷ
quiver(0, 0, 0, omegaL, 'g', 'MaxHeadSize', 0.5, 'LineWidth', 2);  % i��L ������ͷ
quiver(0, 0, 0, -omegaC, 'b', 'MaxHeadSize', 0.5, 'LineWidth', 2); % -i/��C ������ͷ

legend('��λԲ', '����R', '��L �п�', '1/��C �ݿ�', 'Location', 'northeast');  % ͼ��
hold off;
