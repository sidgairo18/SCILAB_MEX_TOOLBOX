# SCILAB_MEX_TOOLBOX

This is a part of my GSoC 2018 project where I have to create a working Demo for the MATLAB Mex module present within Scilab.

- Project Link : https://summerofcode.withgoogle.com/organizations/4726304075677696/#5732869570297856

- Scilab GSoC 2018: https://www.scilab.org/en/projects/gsoc/2018

The Matlab MEX-Files is an API which is a wrapper on the current API Scilab. This would make it very easy to port existing Matlab
MEX toolboxes into Scilab. A module - "mexlib" is already present within Scilab which is compatible with the Matlab-Mex API. Currently
the mex support for Scilab is good but there is a lack of a concrete Demo.

For more details about the project visit my wiki - https://wiki.scilab.org/Working%20Demo%20with%20Usage%20Docs%20for%20the%20Mex%20Module

This repository will be used for developing and porting an existing mex toolbox to Scilab.
For this we have selected the following toolbox - https://github.com/alecjacobson/gptoolbox/tree/master/mex

This project would be divided into the following 3 parts - 
- Working demo in Scilab which is compatible with the Scilab Mex.
- Written Nots/Documentation (basically a help system) of how to run the Demo
- Ensure most function implementations are complete and add test coverage for the mexlib module.

Finally the project will be pushed on Gerrit CodeReview where all the Scilab Development takes place.
- Link : https://codereview.scilab.org/#/q/status:open

More References for creating a toolbox in Scilab - 

1. https://wiki.scilab.org/howto/Create%20a%20toolbox
