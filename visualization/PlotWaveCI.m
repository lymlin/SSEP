 
function CI95 = PlotWaveCI(t,waves)
    % Output: 3nx: mean;CI_low;CI_high
    %waves = reshape(waves,[],[1]);
    t = reshape(t,1,[]);
    
    meanWave = mean(waves,2)';

    W = num2cell(waves',1);
    CIs = cellfun(@Find95CI,W,'UniformOutput',false);
    CI95 = [meanWave;cell2mat(CIs)];


  %Statistics and Machine Learning Toolbox

  figure;
    plot_ci(t,CI95,'PatchColor', 'r','PatchAlpha', 0.2,...
        'MainLineWidth', 2, 'MainLineStyle', '-', 'MainLineColor', 'k', ...
        'LineWidth', 1, 'LineStyle','--', 'LineColor', 'b');

     
    xlabel('Time in [ms]')
    ylabel('Amplitude in [mV]')

    ylim([-0.05 0.05])
    xlim([-5 50])

    
    savefig('MEPCI.fig')
    print('MEPCI.tif','-dtiffn');
    print('MEPCI.svg','-dsvg','-painters');

    try
        PreTimeInms = getPreTimeInms;
        ObserveWindowInms = getObserveWin;


        xlim([-PreTimeInms ObserveWindowInms-10])
        print(strcat('MEPCI-',string(ObserveWindowInms),'.tif'),'-dtiffn');
        print(strcat('MEPCI-',string(ObserveWindowInms),'.svg'),'-dsvg','-painters');        
    catch
        % no action
    end
        
        writematrix([t;CI95]','MEPCI95_data.txt');

end

