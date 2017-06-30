%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
function out = disturbances()

    global ACADO_;
    out = [];
    for i = 1:numel(ACADO_.helper.w)
       out = [out; ACADO_.helper.w{i}];
    end
end