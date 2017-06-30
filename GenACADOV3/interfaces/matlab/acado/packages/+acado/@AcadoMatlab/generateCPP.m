function generateCPP(obj)
%Generate CPP file
%
%  Licence:
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 
    
    %% Basic settings
    % Get global
    global ACADO_;
    if ~exist(ACADO_.pwd)
         error( 'ERROR: Run make script first. Go to <ACADOtoolkit-inst-dir>/interfaces/matlab/ and run <a href="matlab: help make">help make</a>' );
    end
    
    if (isempty(ACADO_.problemname))
       error('ERROR in solve. Problemname is empty. See <a href="matlab: help acadoSet">help acadoSet</a>'); 
    end
    
    obj.problemname = ACADO_.problemname;
    
    % add the exportModule to the instruction list
    if ~isempty(obj.exportModule)
        obj.addInstruction(obj.exportModule);
    end
    
    ACADO_.generatingCode = 1;
    fprintf('Writing c++ files... \n');
    
    if (~isempty(obj.instructionList))
        % File names
        fileIN   = sprintf('%s.cpp', obj.problemname);                     % MEX cpp file name
        fileOUT  = sprintf('%s_RUN', obj.problemname);                     % MEX compiles file name


        % Write empty .m file. This file is needed to run the MEX file
        fileM    = fopen(sprintf('%s_RUN.m', obj.problemname),'w');        % Open MEX .m file
        fclose(fileM);                                                     % Close


        %% Load instructions
        addtimemanual = false;
        if (isempty(obj.t))
            addtimemanual = true;
            acado.TIME('autotime', 1);
        end
        
        obj.fileMEX  = fopen(fileIN, 'w');          % Open MEX cpp file

        obj.getCPPheader();                         % Get default CPP file header
        for i=1:length(obj.instructionList)
           obj.instructionList{i}.getInstructions(obj, 'H'); 
        end

        obj.getCPPbody();                           % Get default CPP file body    

        if (addtimemanual)
            fprintf(obj.fileMEX,sprintf('    TIME autotime;\n'));
        end
    
        for i=1:length(obj.instructionList)
           obj.instructionList{i}.getInstructions(obj, 'FB'); % first body elements
        end
        
        for i=1:length(obj.instructionList)
           obj.instructionList{i}.getInstructions(obj, 'B'); 
        end

        for i=1:length(obj.instructionList)
           obj.instructionList{i}.getInstructions(obj, 'F'); 
        end
        obj.getCPPfooter();                         % Get default CPP file footer (call after all the rest !)


        fclose(obj.fileMEX);                        % Close MEX FILE


        fprintf('Compiling c++ files... \n');

        %% MEX EVAL
        eval(sprintf(regexprep(ACADO_.mexcall, '\\', '\\\\'), fileIN, fileOUT));
        
        % remove the exportModule from the instruction list
        try
            obj.removeInstruction(obj.exportModule);
            obj.removeInstruction(obj.exportModule.ocp.model);
            obj.removeInstruction(obj.exportModule.ocp);
        catch
        end

    else
       
        disp('Nothing to compile.');
        
    end
    
    ACADO_.generatingCode = 0;
    
end