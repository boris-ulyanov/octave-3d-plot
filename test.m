
clc; close all; clear all; warning off;

CSV = csvread('./data.csv');

LAT_COLUMN = 1;
LON_COLUMN = 2;
DATA_COLUMN = 3;

raw_data = CSV(16:end, :);

mlat = raw_data(:, LAT_COLUMN);
mlon = raw_data(:, LON_COLUMN);
mdata = raw_data(:, DATA_COLUMN);

uniq_lat = unique(mlat);
uniq_lon = unique(mlon);

n_lat = length(uniq_lat);
n_lon = length(uniq_lon);

zz = zeros(n_lon, n_lat);

for i = [1:length(raw_data)]
    lat_idx = lookup(uniq_lat, mlat(i));
    lon_idx = lookup(uniq_lon, mlon(i));
    zz(lon_idx, lat_idx) = mdata(i);
endfor

[xx,yy] = meshgrid(uniq_lat, uniq_lon);
mesh(xx, yy, zz);

title('Title');
xlabel('latitude');
ylabel('longitude');
zlabel('param');
