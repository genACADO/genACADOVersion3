%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com

function [name N M] = readVariable(in)

    if ~isa(in, 'char')
       error('Unsupported use of the readVariable function.'); 
    end
    l = strfind(in,'(');
    r = strfind(in,')');
    if ~isempty(l) && ~isempty(r)
        c = strfind(in,',');
        name = in(1:l-1);
        if ~isempty(c)
            [N,OK] = str2num(in(l+1:c-1));
            if ~OK
               N = evalin('base', in(l+1:c-1)); 
            end
            [M,OK] = str2num(in(c+1:r-1));
            if ~OK
               M = evalin('base', in(c+1:r-1)); 
            end
        else
            M = 1;
            [N,OK] = str2num(in(l+1:r-1));
            if ~OK
               N = evalin('base', in(l+1:r-1)); 
            end
        end
    else
        name = in;
        N = 1;
        M = 1;
    end
    if strcmp(name, '0') || strcmp(name, 'NULL')
        N = 0;
        M = 0;
    end

end