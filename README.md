# K-clustering

This repository contains the k-clustering algorithm implemented in matlab and in python. 
The files in this repository are
      k_means.m  - matlab implementation of the k-clustering algorithm.
      
      k_means_with_lab.m - This implementation also uses the LAB color format in clustering, so as to avoid
                           the intensity intrusion in the images.
                           
      k_means_with_lab_and_spatial.m  - In this the clustering is done with not only the use of RGB values,
                                        We have also made use of the spatial co-ordinates to make the cluster 
                                        more suitable for our task where we want to segment pest out of the 
                                        images of leaves.
                                        
      k_means_with_connected_components_2  -   This is an implementation of k-clustering in python. 
                                               It is implemented for pest detection. So in the implementation I had used
                                               spatial co-ordinates too and generated around 20 cluster centers and removed 
                                               those are not closer to green as it will facilitate my project.
