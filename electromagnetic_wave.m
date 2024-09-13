% 定义参数
y = linspace(-2*pi, 2*pi, 100);  % y轴的范围
t = linspace(0, 2*pi, 200);  % 时间范围
[tGrid, yGrid] = meshgrid(t, y);
omega = 1;  % 角频率
k = 1;  % 波数
E0 = 1;  % 电场幅值
B0 = E0;  % 磁场幅值，假设等于电场

% 计算电场和磁场波形的复数形式
E_complex = E0 * exp(1i * (k * yGrid - omega * tGrid));
B_complex = B0 * exp(1i * (k * yGrid - omega * tGrid));

% 取实部用于可视化
E = real(E_complex);
B = real(B_complex);

% 创建动画
figure;
axis([-1 1 -2*pi 2*pi -1 1]);  % 调整轴范围
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('电磁波传播动画');
view(3);  % 初始视角
grid on;
hold on;

% 电场线和磁场线的初始绘制
hE = plot3(E(:,1), y, zeros(size(E(:,1))), 'r', 'LineWidth', 2); % 电场线（沿 x 方向震荡）
hB = plot3(zeros(size(B(:,1))), y, B(:,1), 'b', 'LineWidth', 2); % 磁场线（沿 z 方向震荡）

% 设置图例
legend('电场（E）', '磁场（B）');

filename = 'electromagnetic_wave_y_direction.gif'; % GIF 文件名

for i = 1:length(t)
    % 更新数据
    set(hE, 'XData', E(:,i));
    set(hE, 'YData', y);
    set(hE, 'ZData', zeros(size(E(:,i))));

    set(hB, 'XData', zeros(size(B(:,i))));
    set(hB, 'YData', y);
    set(hB, 'ZData', B(:,i));

    % 设置新的视角 (例如视角框旋转30度)
    view(30, 30);

    drawnow;

    % 捕捉当前帧
    frame = getframe(gcf);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im, 256);

    % 将第一帧写入 GIF 文件，并设置 'LoopCount' 为 Inf 实现无限循环
    if i == 1
        imwrite(imind, cm, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 0.05);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode',...
                'append', 'DelayTime', 0.05);
    end
end

hold off;


