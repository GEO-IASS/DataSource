classdef MatrixSource < DataSource
   properties(Dependent)
      done
   end
   
   methods
      %% Constructor
      function self = MatrixSource(varargin)
         self = self@DataSource;
         if nargin == 0
            return;
         end
         
         if mod(nargin,2)==1 && ~isstruct(varargin{1})
            assert(isnumeric(varargin{1}),...
               'MatrixSource:Constructor:InputFormat',...
                  'Single inputs must be passed in as numeric array');
            varargin = [{'data'} varargin];
         end
         
         p = inputParser;
         p.KeepUnmatched= false;
         p.FunctionName = 'MatrixSource constructor';
         p.addParameter('info',containers.Map('KeyType','char','ValueType','any'));
         p.addParameter('data',0,@isnumeric);
         p.addParameter('tStart',0,@isnumeric);
         p.addParameter('Fs',1,@(x) isnumeric(x) && isscalar(x));
         p.parse(varargin{:});
         par = p.Results;

         self.tStart = par.tStart;
         self.Fs = par.Fs;
         self.data = par.data;
         
         open(self);
      end % constructor
      
      function done = get.done(self)
         done = self.index > self.dim(1);
      end
      
      function open(self)
         if ~self.enabled
            self.enabled = true;
            self.index = 0;
         end
      end
      
      function close(self)
         if self.enabled
            self.enabled = false;
         end
      end
      
      function x = next(self)
         x = [];
         if ~self.done
            if (self.index+1) <= self.dim(1)
               dim = self.dim(2:end);
               trailingInd = repmat({':'},1,numel(dim));
               x = self.data(self.index + 1,trailingInd{:});
               self.index = self.index + 1;
            end
         end
      end
      
      function x = load(self,index)
         
      end
   end
   
   methods(Access = protected)
      function dim = getDim(self)
         dim = size(self.data);
      end
   end

end
