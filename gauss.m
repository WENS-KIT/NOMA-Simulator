function out=gauss(mean,var,s_row,s_column)
%-------------------------------------------------------------------------
%	Generate N(0,1) random variates and transform to N(MEAN,VAR)
%	variates using OUT = (sqrt(VAR)*X) + MEAN)
%-------------------------------------------------------------------------
out = sqrt(var)*randn(s_row,s_column) + mean;