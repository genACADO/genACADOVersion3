%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com

function out = acadoDefined(obj)

global ACADO_;
if ~isempty(obj) && ~isempty(ACADO_) && ~isempty(ACADO_.helper)
    out = 0;
    i = 1;
    while i <= length(ACADO_.helper.instructionList) && ~out
        if strcmp(class(ACADO_.helper.instructionList{i}), class(obj)) && strcmp(ACADO_.helper.instructionList{i}.toString, obj.toString)
            out = 1;
        else
            i = i+1;
        end
    end
else
    out = 0;
end

end