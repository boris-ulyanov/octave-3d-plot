
clc; close all; clear all; warning off;

figure;
hold all;

CSV = csvread('./data.csv');

LAT_COLUMN = 1;
LON_COLUMN = 2;
DATA_COLUMN = 3;

orig_data = CSV(1:15, :);
calc_data = CSV(16:end, :);

m_orig_lat = orig_data(:, LAT_COLUMN);
m_orig_lon = orig_data(:, LON_COLUMN);
m_orig_data = orig_data(:, DATA_COLUMN);

m_calc_lat = calc_data(:, LAT_COLUMN);
m_calc_lon = calc_data(:, LON_COLUMN);
m_calc_data = calc_data(:, DATA_COLUMN);

uniq_lat = unique(m_calc_lat);
uniq_lon = unique(m_calc_lon);

n_lat = length(uniq_lat);
n_lon = length(uniq_lon);

zz = zeros(n_lon, n_lat);

for i = [1:length(calc_data)]
    lat_idx = lookup(uniq_lat, m_calc_lat(i));
    lon_idx = lookup(uniq_lon, m_calc_lon(i));
    zz(lon_idx, lat_idx) = m_calc_data(i);
endfor

[xx,yy] = meshgrid(uniq_lat, uniq_lon);
mesh(xx, yy, zz);
plot3(m_orig_lat, m_orig_lon, m_orig_data, '*b', 'markersize', 20);

title('Title');
xlabel('latitude');
ylabel('longitude');
zlabel('param');
