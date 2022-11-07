# NOMA Simulator

We are happy to announce the release of the NOMA Downlink System Level Simulator source Code.
You can download the matlab file given above.

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
volume={10}, ISSN={2079-9292}, DOI={10.3390/electronics10192388}, number={19}, journal={Electronics}, publisher={MDPI AG}, 
author={Khan, Arsla and Usman, Muhammad Arslan and Usman, Muhammad Rehan and Ahmad, Muneeb and Shin, Soo-Young}, 
year={2021}, month={Sep}, pages={2388}, url={http://dx.doi.org/10.3390/electronics10192388}}

# Abstarct

This study focuses on the design of a MATLAB platform for non-orthogonal multiple access (NOMA) based systems with link-level and system-level analyses. Among the different potential candidates for 5G, NOMA is gaining considerable attention owing to the many-fold increase in spectral efficiency as compared to orthogonal multiple access (OMA). In this study, a NOMA simulator is presented for two and more than two users in a single cell for link-level analysis; whereas, for system-level analysis, seven cells and 19 cells scenarios were considered. Long-term evolution (LTE) was used as the baseline for the NOMA simulator, while bit error rate (BER), throughput and spectral efficiency are used as performance metrics to analyze the simulator performance. Moreover, we demonstrated the application of the NOMA simulator for different simulation scenarios through examples. In addition, the performance of multi-carrier NOMA (MC-NOMA) was evaluated in the presence of AWGN, impulse noise, and intercell interference. To circumvent channel impairments, channel coding with linear precoding is suggested to improve the BER performance of the system.

# About this code

The parameters in the code file are given below:

|# Parameters          |           # OMA                               |            # NOMA                  |
|----------------------|-----------------------------------------------|------------------------------------|
|System Level	         |           Downlink	                           |            Downlink                |
|Random User	         |           2 users	                           |              2 users               |
|Multi-cell	           |        3;7;19 cells	                         |            3;7;19 cells            |
|Frequency	           |       900;1800;2100;2600 MHz	                 |       900;1800;2100;2600 MHz       |
|Propagation Model	   |       Okumura-Hata;Cost-231	                 |         Okumura-Hata;Cost-231      |
|Imperfect SIC	       |               N/A	                           |                  ✔                 |
|Interference	         | Intercell interference;SINR	                 |   Intercell Interference;SINR      |
|Cell Capacity       	 |User capacity;Ergodic sum capacity	           |User capacity;Ergodic sum capacity  |

# Software 
Matlab R2017b or above
Please download Runtime installer if you encounter .dll error.

# Reference Papers
[1]  Muhammad Basit Shahab, Mohammad Irfan, Md. Fazlul Kader, Soo Young Shin. "User pairing schemes for capacity maximization in non-orthogonal multiple access systems", Wireless Communications and Mobile Computing, Volume 16, No. 17, pp 2884-2894 September 2016. (IF: 0.922). 5G.

[2]  Muhammad Basit Shahab, Md. Fazlul Kader, Soo Young Shin. "A Virtual User Pairing Scheme to Optimally Utilize the Spectrum of Unpaired Users in Non-orthogonal Multiple Access", IEEE Signal Processing Letters, Volume 23, No. 12, pp 1766-1770 October 2016. (IF: 1.661). 5G.

[3]  Md. Fazlul Kader, Soo Young Shin. "Exploiting cooperative diversity with nonorthogonal multiple access over slow fading channel", International Journal of Electronics, Volume 104, No. 6, pp 1050-1062 February 2017. (IF: 0.729). 5G.

[4]  Muhammad Basit Shahab, Soo Young Shin. "On the performance of a virtual user pairing scheme to efficiently utilize the spectrum of unpaired users in NOMA", Physical Communication, Volume 25, pp 492-501 October 2017. (IF: 1.522). 5G. 

[5]  Muhammad Basit Shahab, Soo Young Shin. "On the performance of a virtual user pairing scheme to efficiently utilize the spectrum of unpaired users in NOMA", Physical Communication, Volume 25, No. 2, pp 492-501 December 2017. (IF: 1.522). 5G.  

[6]  Muhammad Basit Shahab, Soo Young Shin. "User pairing and power allocation for non-orthogonal multiple access: Capacity maximization under data reliability constraints", Physical Communication, Volume 30, No. 1, pp 132-144 October 2018. (IF: 1.522). ITRC-2017.  

[7]  Mohammed Belal Uddin, Md. Fazlul Kader, Anik Islam, Soo Young Shin. "Power Optimization of NOMA for Multi-Cell Networks", THE JOURNAL OF KOREA INFORMATION AND COMMUNICATIONS SOCIETY, Volume 43, No. 7, pp 1182-1190 July 2018. ITRC-2018.      

[8] Fahri Wisnu Murti, Rahmat Faddli Siregar, Soo Young Shin. "Exploiting non-orthogonal multiple access in downlink coordinated multipoint transmission with the presence of imperfect channel state information", International Journal of Communication Systems, Volume 33, No. 14, pp 1-1 September 2020. (IF: 1.319). B5G.   

[9] Denny Kusuma Hendraningrat, Muhammad Basit Shahab, Soo Young Shin. "Virtual User Pairing Based Non-Orthogonal Multiple Access in Downlink Coordinated Multipoint Transmissions", IET Communications, Volume 14, No. 12, pp 1910-1917 July 2020. (IF: 1.779). B5G.   

[10] Man Hee Lee, Shahab Muhammad Basit, Soo Young Shin. "On the Performance of Non-orthogonal Multiple Access considering Backward Compatibility", Physical Communication, Priority Center-2019.

[11] Mohammed Belal Uddin, Md. Fazlul Kader, Soo Young Shin. "Exploiting NOMA in D2D Assisted Full-Duplex Cooperative Relaying", Physical Communication, Priority Center-2018.

[12] Denny Kusuma Hendraningrat, Bhaskara Narottama, Soo Young Shin. "Non-Orthogonal Multiple Access in Downlink Coordinated Multipoint Transmissions", Physical Communication, pp 1-26.

[13] Muneeb Ahmad, I Nyoman Apraz Ramatryana, Soo Young Shin. "NOMA and OMA Comparison for Multiple Antenna Technologies under High Capacity Constraints for 5G and Beyond 5G", Journal of Korean Institute of Communications and Information Sciences, Volume 45, No. 11, pp 2004-2013 November 2020. 2020년 교내과제.
