% 参数设置
figure;    % 创建新图形窗口
hold on;   % 允许在同一图形上绘制多个图像
axis equal;  % 使坐标轴比例相等
xlabel('实部');
ylabel('虚部');
title('交流电路中R、L和C的相位关系');
grid on;

% 坐标系限制
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);

% 绘制单位圆
theta = linspace(0, 2*pi, 100);
plot(cos(theta), sin(theta), 'k--');  % 画出单位圆

% 电阻相量
plot([0 1], [0 0], 'r', 'LineWidth', 2);  % 电阻 R 相量为实轴上的一个向量
text(1.1, 0, 'R', 'Color', 'r', 'FontSize', 12);  % 标记电阻 R

% 电感相量，使用 iωL，沿正虚轴
omegaL = 1;  % 假设 ωL=1
plot([0 0], [0 omegaL], 'g', 'LineWidth', 2);  % 电感 L 相量为虚轴上的一个向量
text(0, omegaL + 0.1, 'iωL', 'Color', 'g', 'FontSize', 12);  % 标记 iωL

% 电容相量，使用 -i/(ωC)，沿负虚轴
omegaC = 1;  % 假设 1/(ωC)=1
plot([0 0], [0 -omegaC], 'b', 'LineWidth', 2);  % 电容 C 相量为负虚轴上的一个向量
text(0, -omegaC - 0.1, '-i/ωC', 'Color', 'b', 'FontSize', 12);  % 标记 -i/ωC

% 绘制箭头
quiver(0, 0, 1, 0, 'r', 'MaxHeadSize', 0.5, 'LineWidth', 2);  % R 相量箭头
quiver(0, 0, 0, omegaL, 'g', 'MaxHeadSize', 0.5, 'LineWidth', 2);  % iωL 相量箭头
quiver(0, 0, 0, -omegaC, 'b', 'MaxHeadSize', 0.5, 'LineWidth', 2); % -i/ωC 相量箭头

legend('单位圆', '电阻R', 'ωL 感抗', '1/ωC 容抗', 'Location', 'northeast');  % 图例
hold off;
