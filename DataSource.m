classdef(Abstract) DataSource < handle
   properties(Abstract)
      
   end
   
   properties(SetAccess = protected)
      tStart
      Fs
      dim
      data
      
      path
      filename
      fid
      
      inputFormat
      outputFormat
      
      index
      
      enabled = false
   end
   properties(Abstract)
      done
   end
   methods(Abstract)
      open
      close
      
      next
      load
   end
   
   methods(Abstract, Access = protected)
      getDim(self)
      %getFs(self)
   end
   
   methods
      function dim = get.dim(self)
         % Wrap abstract function
         dim = getDim(self);
         self.dim = dim;
      end
      
      function B = subsref(self,S)
         % Shortcut direct access to data
         switch S(1).type
            case '()'
               B = self.data(S(1).subs{:});
               if numel(S) > 1
                  B = builtin('subsref',self,S(2:end));
               end
            otherwise
               % Enable normal "." and "{}" behavior
               B = builtin('subsref',self,S);
         end
      end
   end
end
