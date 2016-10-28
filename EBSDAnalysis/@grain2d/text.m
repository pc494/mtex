function h = text(grains,txt,varargin)
% plot directions at grain centers
%
% Syntax
%   text(grains(29),'A')
%
% Input
%  grains - @grain2d
%


xy = grains.centroid;

h = optiondraw(text(xy(:,1),xy(:,2),txt),varargin{:});

if nargout == 0, clear h; end

end
