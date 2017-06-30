%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com

function out = diffStates()

    global ACADO_;
    out = [];
    for i = 1:numel(ACADO_.helper.x)
       out = [out; ACADO_.helper.x{i}];
    end
end