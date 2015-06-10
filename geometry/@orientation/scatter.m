function varargout = scatter(o,varargin)
% plots ebsd data as scatter plot
%
% Syntax
%   scatter(ebsd,<options>)
%
% Input
%  ebsd - @EBSD
%
% Options
%  axisAngle - axis angle projection
%  Rodrigues - rodrigues parameterization
%  points    - number of orientations to be plotted
%  center    - orientation center
%
% See also
% EBSD/plotPDF savefigure

% subsample to reduce size
if length(o) > 2000 || check_option(varargin,'points')
  points = fix(get_option(varargin,'points',2000));
  disp(['plot ', int2str(points) ,' random orientations out of ', ...
    int2str(length(o)),' given orientations']);
  o = o.discreteSample(fix(points));
end

[mtexFig,isNew] = newMtexFigure(varargin{:});

% plot
[varargout{1:nargout}]= scatter@rotation(rotation(o),'parent',mtexFig.gca,varargin{:});

if isNew
  set(mtexFig.parent,'Name',['Scatter plot of "',get_option(varargin,'FigureTitle',inputname(1)),'"']);
  fcw
end
