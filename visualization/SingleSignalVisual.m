function Annotation_Matrix = SingleSignalVisual(trials,xlimit,ylimit)

    if(~exist('xlimit','var'))
        xlimit = [-getPreTimeInms,getObserveWin];
    end
    
    if(~exist('ylimit','var'))
        ylimit = [-0.5,0.5];
    end

   

    

    config.PeakWindow = [15 40]; % Target Interval for calculation of peak-to-peak amplitude
    config.SamplingFrequency = getFs; % Sampling Frequency in Hz
    config.ChannelNames = {'EMG1'}; % Some simple Channel Names
    config.TriggerTime = getPreTimeInms; % Time of TMS pulse. Pulse was delievered 5ms after the first data point.
    config.demean = 'yes'; % Demean each trial
    config.unit = 'mV'; % Unit for axis-labels; 'V', 'mV', '?V
    config.Xlimit = xlimit;
    config.Ylimit = ylimit;
    Annotation_Matrix = MEP_Visualizer(trials, config);  

end