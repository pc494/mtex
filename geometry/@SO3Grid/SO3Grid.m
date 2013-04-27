classdef SO3Grid < orientation
%  
% Syntax
%  S3G = SO3Grid(nodes,CS,SS)
%  S3G = SO3Grid(points,CS,SS)
%  S3G = SO3Grid(resolution,CS,SS)
%
% Input
%  points     - number of nodes
%  nodes      - @quaternion
%  resolution - double
%  CS, SS     - @symmetry groups
%
% Options
%  regular    - construct a regular grid
%  equispaced - construct a equispaced grid%
%  phi        - use phi
%  ZXZ, Bunge - Bunge (phi1 Phi phi2) convention
%  ZYZ, ABG   - Matthies (alpha beta gamma) convention
%  MAX_ANGLE  - only up to maximum rotational angle
%  CENTER     - with respect to this given center

  
  properties
    alphabeta = [];
    gamma    = [];
    resolution = 2*pi;
    options = {};
    center  = [];
  end
  
  methods
    function S3G = SO3Grid(ori,alphabeta,gamma,varargin)
      
      % call superclass method
      S3G = S3G@orientation(ori);

      S3G.alphabeta = alphabeta;
      S3G.gamma = gamma;
      S3G.center = get_option(varargin,'center',idquaternion);
      S3G.resolution = get_option(varargin,'resolution',2*pi);
      S3G.options = {};
    end         
  end
end


%if check_option(G,'indexed') && check_option(varargin,'MAX_ANGLE')
%  center = get_option(varargin,'center',idquaternion);
%  G = subGrid(G,center,maxangle);
%end

% -------------------------------------------------------------------------
function q = axisAngleGrid(varargin)

% extract axes and angles
axes = S2Grid('plot','north',varargin{:});  
angles = linspace(0,pi,6);
angles = get_option(varargin,'angles',angles,'double');
% compute quaternions
q = axes2quat_outer(axes,angles);

end

