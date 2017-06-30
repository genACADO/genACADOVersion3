function getInstructions(obj, cppobj, get)
%  Licence:
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 



if (get == 'B')
    
    % HEADER 
    
    if (~isempty(obj.grid))  % GRID
        
        fprintf(cppobj.fileMEX,sprintf('    Grid grid_%s(%s);\n', obj.grid.name, obj.grid.name));
        fprintf(cppobj.fileMEX,sprintf('    OCP %s(grid_%s);\n', obj.name, obj.grid.name));


    elseif(~isempty(obj.tStart)) % NORMAL

        if (~isempty(obj.N))
            fprintf(cppobj.fileMEX,sprintf('    OCP %s(%s, %s, %s);\n', obj.name, obj.tStart.name, obj.tEnd.name, obj.N.name));
        else
            fprintf(cppobj.fileMEX,sprintf('    OCP %s(%s, %s);\n', obj.name, obj.tStart.name, obj.tEnd.name));
        end
    
    else % NO ARGUMENTS
        fprintf(cppobj.fileMEX,sprintf('    OCP %s;\n', obj.name));
        
    end
    
    
    
    % COST FUNCTION    

    for i=1:length(obj.minMayerTerms)   % MIN MAYER
        fprintf(cppobj.fileMEX,sprintf('    %s.minimizeMayerTerm(%s);\n', obj.name, obj.minMayerTerms{i}.toString));
    end
    
    for i=1:length(obj.maxMayerTerms)   % MAX MAYER
        fprintf(cppobj.fileMEX,sprintf('    %s.maximizeMayerTerm(%s);\n', obj.name, obj.maxMayerTerms{i}.toString));
    end
    
    for i=1:length(obj.minLagrangeTerms)% MIN LAGRANGE
        fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLagrangeTerm(%s);\n', obj.name, obj.minLagrangeTerms{i}.toString));
    end
    
    for i=1:length(obj.maxLagrangeTerms)% MAX LAGRANGE
        fprintf(cppobj.fileMEX,sprintf('    %s.maximizeLagrangeTerm(%s);\n', obj.name, obj.maxLagrangeTerms{i}.toString));
    end
    
    for i=1:length(obj.minLSQTermh)     % MIN LSQ
        if (~isempty(obj.minLSQTermS{i}) && ~isempty(obj.minLSQTermr{i})) % S,h,r
            fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLSQ(%s, %s, %s);\n', obj.name, obj.minLSQTermS{i}.name, obj.minLSQTermh{i}.name, obj.minLSQTermr{i}.name));
        elseif (~isempty(obj.minLSQTermr{i})) % h,r
            fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLSQ(%s, %s);\n', obj.name, obj.minLSQTermh{i}.name, obj.minLSQTermr{i}.name));
        else % h
            fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLSQ(%s);\n', obj.name, obj.minLSQTermh{i}.name));
        end
    end
    
    if ~isempty(obj.minLSQTermQ) && ~isempty(obj.minLSQTermR)
        fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLSQ(%s, %s);\n', obj.name, obj.minLSQTermQ.name, obj.minLSQTermR.name));
    end
    
    for i=1:length(obj.minLSQEndTermh)  % MIN LSQ END TERM
        if (~isempty(obj.minLSQEndTermS{i}) && ~isempty(obj.minLSQEndTermr{i})) % S,h,r
            fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLSQEndTerm(%s, %s, %s);\n', obj.name, obj.minLSQEndTermS{i}.name, obj.minLSQEndTermh{i}.name, obj.minLSQEndTermr{i}.name));
        elseif (~isempty(obj.minLSQEndTermr{i})) % h,r
            fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLSQEndTerm(%s, %s);\n', obj.name, obj.minLSQEndTermh{i}.name, obj.minLSQEndTermr{i}.name));
        else % h
            error('error minimizeLSQEndTerm write');
        end
    end
    
    if ~isempty(obj.minLSQTermSlx) && ~isempty(obj.minLSQTermSlu)
       if length(obj.minLSQTermSlx) > 1 || length(obj.minLSQTermSlu) > 1
           error('linear terms are define more than once!');
       else
           fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLSQLinearTerms(%s, %s);\n', obj.name, obj.minLSQTermSlx{1}.name, obj.minLSQTermSlu{1}.name));
       end
    end
    
    if ~isempty(obj.minLSQEndTermQ)
        if isempty(obj.minLSQEndTermR)
            fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLSQEndTerm(%s);\n', obj.name, obj.minLSQEndTermQ.name));
        else
            fprintf(cppobj.fileMEX,sprintf('    %s.minimizeLSQEndTerm(%s, %s);\n', obj.name, obj.minLSQEndTermQ.name, obj.minLSQEndTermR.name));
        end
    end
    
    
    
    % SUBJECT TO
    for i=1:length(obj.subjectoItems)
        fprintf(cppobj.fileMEX,sprintf('    %s.subjectTo(%s);\n', obj.name, obj.subjectoItems{i}));
    end
    
    
    % INTEGRATION GRID
    if (~isempty(obj.integrationGrid))
        fprintf(cppobj.fileMEX,sprintf('    %s.setIntegrationGrid( %s );\n', obj.name, obj.integrationGrid.name));
    end
    
    
    % DIFFERENTIAL EQUATION
    obj.getModelFormulation(cppobj, get);
    

    fprintf(cppobj.fileMEX,'\n');
end 
end