%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com

function out = algStates()

    global ACADO_;
    out = [];
    for i = 1:numel(ACADO_.helper.z)
       out = [out; ACADO_.helper.z{i}];
    end
end