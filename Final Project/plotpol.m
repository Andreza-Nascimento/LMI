function plotpol(varargin)
    % plotlatex(fig, textxlab, textylab, titulo, legenda)

    narginchk(3, 5);
  
    isString = false;
    str = varargin{3};
    isString = ischar(str);

    if nargin == 3
        pgon = varargin{1};
        textxlab = varargin{2};
        textylab = varargin{3};
        addTitle = false;
        addLegend = false;
    elseif nargin == 4 && isString
        pgon = varargin{1};
        textxlab = varargin{2};
        textylab = varargin{3};
        addTitle = true;
        titulo = varargin{4};
        addLegend = false;
    elseif nargin == 4 && ~isString
        pgon = varargin{1};
        textxlab = varargin{2};
        textylab = ' ';
        addTitle = true;
        titulo = varargin{4};
        addLegend = false;
    elseif nargin == 5
        pgon = varargin{1};
        textxlab = varargin{2};
        textylab = varargin{3};
        addTitle = true;
        titulo = varargin{4};
        addLegend = true;
        legendStr = varargin{5};
    else
        error('Invalid number of input arguments');
    end

    fig = figure; clf

    plot(pgon,'FaceColor','red','FaceAlpha', 0.05,'LineStyle','-.');

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
        'FontSize',     12);

    % remove unnecessary white space
    set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
    hold off
end