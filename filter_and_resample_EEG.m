function resampled_channel = filter_and_resample_EEG( ...
    channel, lpFilt, hpFilt, fs_new, sampling_frequency)

    % Force double precision
    channel = double(channel(:));   % column vector

    % Zero-phase filtering
    channel = filtfilt(hpFilt, channel);
    channel = filtfilt(lpFilt, channel);

    % Rational resampling
    [p, q] = rat(fs_new / sampling_frequency);
    resampled_channel = resample(channel, p, q);
end