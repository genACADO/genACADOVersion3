
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com

function out = parameters()

    global ACADO_;
    out = [];
    for i = 1:numel(ACADO_.helper.p)
       out = [out; ACADO_.helper.p{i}];
    end
end