function customBode(varargin)
       % customBode(sys1, sys2, titleText, leg1)
    
    narginchk(3,4);  

    if nargin == 3
        sys1 = varargin{1};
        titleText = varargin{2};
        leg1 = varargin{3};
    elseif nargin == 4
        sys1 = varargin{1};
        sys2 = varargin{2};
        titleText = varargin{3};
        leg1 = varargin{4};
    else
        error('Invalid number of input arguments');
    end
       
    % Create the figure
    fig = figure; clf
    div = 1;
    fontSize = 23;
    fontType = 'Times';
    fontSize = fix(fontSize/div);

    % Generate the frequency response
    if nargin == 3
        bode(sys1);
    else
        bode(sys1,'r',sys2,'b');
    end

    grid on;

    % define figure properties
    opts.Colors     = get(groot,'defaultAxesColorOrder');
    opts.saveFolder = 'img/';
    opts.width      = 20;
    opts.height     = 10;
    opts.fontType   = 'Times';
    opts.fontSize   = 24.6;

    % scaling
    fig.Units               = 'centimeters';
    fig.Position(3)         = opts.width;
    fig.Position(4)         = opts.height;

    % remove unnecessary white space
    set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
    hold off

    title(titleText,'HorizontalAlignment', 'center', 'FontSize', fontSize, 'FontName', fontType);

    % Set font size for legend text
    hLegend = legend(leg1);    
    set(hLegend, 'FontSize', 10, 'FontName', fontType);
    % hLegend = legend(legendStr, 'Location', 'southeast', 'NumColumns',3, 'FontSize',2);

    % Get the correct axes handle (ax)
    axs = findall(gcf,'Type','Axes'); % call immediately after producing figure
    titles = axs.Title;
    ax = axs(arrayfun(@(t)strcmpi(t.String, titleText),[axs.Title]));

    sz = 12;
    name = 'Times';

    % Change xlabel fontsize
    ax.XLabel.FontSize = sz;
    ax.YLabel.FontSize = sz;
    ax.XLabel.FontName = name;
    ax.YLabel.FontName = name;
end

