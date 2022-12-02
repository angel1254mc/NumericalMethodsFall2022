function [ F ] = compute_dft( f )
    %%dft computes the discrete Fourier transform from a given discrete signal
    %%Input:  f - discrete signal (time domain)
    %%Output: F - DFT (frequency domain)
    %%Author: Angel Lopez Pol, University Of Florida

    % From what I remember and based on the notes, we are
    % getting a function of Frequency from a function of time
    
    % F Should be a collection of values like f
    F = zeros(1, length(f)-1)
    for k = 1:(length(f))
        F(k) = 0;
        for n = 1:(length(f)-1)
            F(k) = F(k) + f(n)*exp(-j*2*pi*k/(length(f)));
        end
    end
    % By the time this double for loop is over, there should be an Fk value
    % for every k, where k goes from 1:n-1
end
