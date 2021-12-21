# NOMA Simulator

We are happy to announce the release of the NOMA Downlink System Level Simulator.

To get access to the download link simulator, please send an e-mail to WENS Laboratory (labwens@gmail.com) including:

1) Identity (name, date of birth, e-mail, phone number, address, and institution)

2) The reason/purpose for using the NOMA Simulator.

The features of thie simulator are listed below. You can also check the list of features and the documentation of the new version on the webpage of the corresponding simulator. You can download our paper regarding NOMA simulator from the link given below.

You are welcome to post your questions/comments/feedback to the WENS Laboratory (labwens@gmail.com). Our team will try to support you as soon as possible. Please also read the license agreement carefully to check whether you would need our permission to use the simulator.

Best regards,
The NOMA Simulator Team.


# Paper

Khan, A.; Usman, M.A.; Usman, M.R.; Ahmad, M.; Shin, S.-Y. Link and System-Level NOMA Simulator: The Reproducibility of Research. Electronics 2021, 10, 2388. 
https://doi.org/10.3390/electronics10192388

@article{2021, title={Link and System-Level NOMA Simulator: The Reproducibility of Research}, 
volume={10}, ISSN={2079-9292}, url={http://dx.doi.org/10.3390/electronics10192388}, 
DOI={10.3390/electronics10192388}, number={19}, journal={Electronics}, publisher={MDPI AG}, 
author={Khan, Arsla and Usman, Muhammad Arslan and Usman, Muhammad Rehan and Ahmad, Muneeb and Shin, Soo-Young}, 
year={2021}, month={Sep}, pages={2388}}

# Abstarct

This study focuses on the design of a MATLAB platform for non-orthogonal multiple access (NOMA) based systems with link-level and system-level analyses. Among the different potential candidates for 5G, NOMA is gaining considerable attention owing to the many-fold increase in spectral efficiency as compared to orthogonal multiple access (OMA). In this study, a NOMA simulator is presented for two and more than two users in a single cell for link-level analysis; whereas, for system-level analysis, seven cells and 19 cells scenarios were considered. Long-term evolution (LTE) was used as the baseline for the NOMA simulator, while bit error rate (BER), throughput and spectral efficiency are used as performance metrics to analyze the simulator performance. Moreover, we demonstrated the application of the NOMA simulator for different simulation scenarios through examples. In addition, the performance of multi-carrier NOMA (MC-NOMA) was evaluated in the presence of AWGN, impulse noise, and intercell interference. To circumvent channel impairments, channel coding with linear precoding is suggested to improve the BER performance of the system.

# About this code

the parameters in the code file are adjusted according to the table below:

# Parameters                     # OMA                                           # NOMA
System Level	                  Downlink	                                       Downlink
Random User	                    2 users	                                         2 users
Multi-cell	                   3;7;19 cells	                                     3;7;19 cells
Frequency	                  900;1800;2100;2600 MHz	                        900;1800;2100;2600 MHz
Propagation Model	          Okumura-Hata;Cost-231	                          Okumura-Hata;Cost-231
Imperfect SIC	                      N/A	                                             ✔
Interference	          Intercell interference;SINR	                    Intercell Interference;SINR
Cell Capacity       	 User capacity;Ergodic sum capacity	           User capacity;Ergodic sum capacity
