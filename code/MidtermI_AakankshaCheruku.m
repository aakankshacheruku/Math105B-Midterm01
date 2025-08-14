
% Math105B — Midterm 01 (MATLAB)
% Hand Curve Approximation
% Author: Aakanksha Cheruku
% Date: 2025-08-14
%
% HOW TO USE:
% 1) Replace the placeholder x,y with points extracted from your hand outline,
%    OR load them from data/hand_curve_points.csv (two columns: x,y).
% 2) Choose your approximation method(s) below (spline/poly/piecewise).
% 3) Uncomment the saveas line to export a figure to report/.

clear; clc; close all;

% ---- Load or define points ----
% Option A: Load CSV if present
csv_path = fullfile('data','hand_curve_points.csv');
if exist(csv_path,'file')
    T = readtable(csv_path);
    x = T.x(:); y = T.y(:);
else
    % Option B: Placeholder points (replace these with your extracted points)
    x = linspace(0, 10, 120)';
    y = 2 + 0.6*sin(x) + 0.2*cos(2*x);
end

% ---- Approximation method(s) ----
% Example 1: Cubic spline over the whole range
pp = spline(x, y);
xx = linspace(min(x), max(x), 600);
yy = ppval(pp, xx);

% Example 2: Polynomial least squares of degree n (optional)
% n  = 5;
% V  = vander(x); V = V(:, end-n-1:end);    % build degree-n basis
% c  = V \ y;
% yy2 = polyval(c.', xx);

% ---- Plot ----
figure('Color','w'); hold on;
plot(x, y, 'k.', 'MarkerSize', 9, 'DisplayName','hand points');
plot(xx, yy, 'b-', 'LineWidth', 1.5, 'DisplayName','spline approx');
% plot(xx, yy2,'r--','LineWidth',1.2,'DisplayName',sprintf('poly deg %d',n));
grid on; legend('Location','best');
xlabel('x'); ylabel('y'); title('Midterm I — Hand Curve Approximation');

% ---- Save (optional) ----
% if ~exist('report','dir'), mkdir report; end
% saveas(gcf, fullfile('report','midterm1_curve.png'));
