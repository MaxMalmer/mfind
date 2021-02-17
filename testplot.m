% Script for plotting testdata for Laboration 4 5DV088 HT19
% Max Malmer, c17mmr@cs.umu.se
% Version 1.0, 2019-10-24

fid = fopen( 'test3.txt' );
s = textscan(fid,'%f',100);
fclose(fid);
y = s{1};
x = (1:100);
plot(x, y)
legend('real', 'user', 'sys')
xlabel('TimesRun'), ylabel('TimeInSec')