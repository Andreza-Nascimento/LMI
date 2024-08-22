function plot_dstability(varargin)
    % plotlatex(textxlab, textylab, titulo, legenda)

    textxlab = varargin{1};
    textylab = varargin{2};
    addTitle = true;
    titulo = varargin{3};
    addLegend = true;
    legendStr = varargin{4};

    fig = figure; clf
    
    % Define functions
    f1 = @(x) x;
    f2 = @(x) -x;
    
    % Plot the functions
    fplot(f1, 'b', 'LineWidth', 1); % Line color: blue, Line width: 1
    xlim([-1250 0]);
    hold on;
    fplot(f2, 'b', 'LineWidth', 1); % Line color: blue, Line width: 1
    xline(-83.33, 'r', 'h1', 'LineWidth', 1); % Line color: red, Line width: 1, Label: 'h1'
    xline(-1250, 'k', 'h2', 'LineWidth', 1); % Line color: black, Line width: 1, Label: 'h2'
    
    % Define the intersection area
    x_fill = [-83.33 -1250 -1250 -83.33];
    y_fill = [f2(-83.33) f2(-1250) f1(-1250) f1(-83.33)];
    
    % Mark intersection area
    fill(x_fill, y_fill, 'y', 'FaceAlpha', 0.5);
    
    grid on;

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
        % legend(legendStr, 'Location', 'southeast', 'NumColumns',3, 'FontSize',2);
        hLegend = legend(legendStr, 'Location', 'southeast', 'NumColumns',3, 'FontSize',2);
    end

    % Customize legend properties
    % set(hLegend, 'Units', 'normalized', 'Position', [0.7, 0.2, 0.15, 0.2]);
    
    % Set font size for legend text
    set(hLegend, 'FontSize', 10);

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
