% Math105B — Midterm 01 (MATLAB)
% Hand Curve Approximation (starter scaffold)
% Rename/edit as needed: MidtermI_AakankshaCheruku.m

clear; clc; close all;

% === TODO: Replace with points from your hand outline extraction ===
% Example placeholder curve so figures render:
x = linspace(0, 10, 100)';           % sample x-coordinates
y = 2 + 0.6*sin(x) + 0.2*cos(2*x);   % sample y-coordinates

% === Choose & implement your approximation method(s) ===
% Options: spline fitting, polynomial least squares, piecewise models, etc.
pp = spline(x, y);                 % placeholder: cubic spline fit
xx = linspace(min(x), max(x), 500);
yy = ppval(pp, xx);

% === Plot ===
figure('Color','w'); hold on;
plot(x, y, 'k.', 'MarkerSize', 10, 'DisplayName','sample points');
plot(xx, yy, 'b-', 'LineWidth', 1.5, 'DisplayName','approximated curve');
legend('Location','best'); grid on;
xlabel('x'); ylabel('y'); title('Hand Curve Approximation');

% Save figure (optional):
% if ~exist('report','dir'); mkdir report; end
% saveas(gcf, 'report/figure_midterm1.png');
