%  College Name: Indian Institute of Information Technology Nagpur
%  Subject: Wireless Communication
%  Created By: Aryan Mewara
%  Created On: 1.02.2024 
%  Project Name: Pdf and Cdf of gaussian Function
%  Tool: Matlab
%  Description: 
% Define the range of x values
x_values = -5:0.1:5;

% Parameters of the Gaussian distributions
mus = [0, 0, 0]; % Means
sigmas = [0.5, 1, 1.5]; % Standard deviations

% Plot the PDF and CDF for each Gaussian distribution
figure;

% Loop over different standard deviations
for i = 1:length(sigmas)
    % Compute the PDF (probability density function) of the Gaussian distribution
    pdf_values = normpdf(x_values, mus(i), sigmas(i));
    
    % Compute the CDF (cumulative distribution function) of the Gaussian distribution
    cdf_values = normcdf(x_values, mus(i), sigmas(i));
    
    % Plot the PDF
    subplot(length(sigmas), 2, 2*i-1);
    plot(x_values, pdf_values);
    title(['PDF of Gaussian Distribution (\sigma = ', num2str(sigmas(i)), ')']);
    xlabel('x');
    ylabel('PDF');
    
    % Plot the CDF
    subplot(length(sigmas), 2, 2*i);
    plot(x_values, cdf_values);
    title(['CDF of Gaussian Distribution (\sigma = ', num2str(sigmas(i)), ')']);
    xlabel('x');
    ylabel('CDF');
end