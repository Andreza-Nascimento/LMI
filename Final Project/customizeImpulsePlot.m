function customizeImpulsePlot(varargin)
       % customizeImpulsePlot(sys1, lineColorStyle, sys2, lineColorStyle2, titleText, xLabel, yLabel, leg1,numsys)
    
    narginchk(6, 8);  

    if nargin == 6
        sys1 = varargin{1};
        lineColorStyle = varargin{2};
        titleText = varargin{3};
        xLabel = varargin{4};
        yLabel = varargin{5};
        leg1 = varargin{6};
    elseif nargin == 8
        sys1 = varargin{1};
        lineColorStyle = varargin{2};
        sys2 = varargin{3};
        lineColorStyle2 = varargin{4};
        titleText = varargin{5};
        xLabel = varargin{6};
        yLabel = varargin{7};
        leg1 = varargin{8};
    else
        error('Invalid number of input arguments');
    end   
       
    % Create the figure
    fig = figure; clf
    lineWidth = 1;
    fontSize = 23;
    fontType = 'Times';
    div = 1;
    fontSize = fix(fontSize/div);

    % Generate the impulse response plot
    if nargin == 6
        impulse(sys1, lineColorStyle);
    else
        impulse(sys1, lineColorStyle, sys2, lineColorStyle2);
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

    % Customize the plot appearance
    title(titleText,'HorizontalAlignment', 'center', 'FontSize', fontSize, 'FontName', fontType);
    xlabel(xLabel,'HorizontalAlignment', 'center', 'FontSize', fontSize, 'FontName', fontType);
    ylabel(yLabel,'HorizontalAlignment', 'center', 'FontSize', fontSize, 'FontName', fontType);

    % Set font size for legend text
    hLegend = legend(leg1);    
    set(hLegend, 'FontSize', 10, 'FontName', fontType);

    % Customize the line appearance
    lines = findall(gcf, 'Type', 'Line');
    set(lines, 'LineWidth', lineWidth);

    % remove unnecessary white space
    set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
end
