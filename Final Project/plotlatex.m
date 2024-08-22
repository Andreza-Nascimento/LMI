function plotlatex(varargin)
    % plotlatex(x, y, textxlab, textylab, titulo, legenda)

    narginchk(3, 6);

    isString = false;
    str = varargin{2};
    isString = ischar(str);
    
    if nargin == 3 && ~isString
        x = [];
        y = varargin{1};
        textxlab = varargin{2};
        textylab = varargin{3};
        addTitle = false;
        addLegend = false;
    elseif nargin == 3 && isString
        x = [];
        y = varargin{1};
        textxlab = varargin{2};
        textylab = varargin{3};
        addTitle = false;
        addLegend = false;
    elseif nargin == 4 && ~isString
        x = varargin{1};
        y = varargin{2};
        textxlab = varargin{3};
        textylab = varargin{4};
        addTitle = false;
        addLegend = false;
    elseif nargin == 4 && isString
        x = [];
        y = varargin{1};
        textxlab = varargin{2};
        textylab = varargin{3};
        addTitle = true;
        titulo = varargin{4};
        addLegend = false;
    elseif nargin == 5
        x = varargin{1};
        y = varargin{2};
        textxlab = varargin{3};
        textylab = varargin{4};
        addTitle = true;
        titulo = varargin{5};
        addLegend = false;
    elseif nargin == 6
        x = varargin{1};
        y = varargin{2};
        textxlab = varargin{3};
        textylab = varargin{4};
        addTitle = true;
        titulo = varargin{5};
        addLegend = true;
        legendStr = varargin{6};
    else
        error('Invalid number of input arguments');
    end

    fig = figure; clf

    if ~isempty(x)
        plot(x, y);
    else
        plot(y);
    end
    hold on

    grid on

    % define figure properties
    opts.Colors     = get(groot,'defaultAxesColorOrder');
    opts.saveFolder = 'img/';
    opts.width      = 20;
    opts.height     = 10;
    opts.fontType   = 'Times';
    opts.fontSize   = 24.6;

    % add axis labels and title with centralization
    axis tight

    if addTitle
        title(titulo, 'HorizontalAlignment', 'center')
    end
    
    xlabel(textxlab, 'HorizontalAlignment', 'center')
    ylabel(textylab, 'HorizontalAlignment', 'center')
    
    if addLegend
        legend(legendStr);
    end

    % scaling
    fig.Units               = 'centimeters';
    fig.Position(3)         = opts.width;
    fig.Position(4)         = opts.height;

    % set text properties
    set(fig.Children, ...
        'FontName',     'Times', ...
        'FontSize',     23);

    % remove unnecessary white space
    set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
    hold off
end
