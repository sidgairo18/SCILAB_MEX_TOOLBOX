/*                                                                      
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 *
 * Copyright (C) 2018-2018 - GSoC 2018 - Siddhartha Gairola
 *                                                                      
 * This file is hereby licensed under the terms of the GNU GPL v2.0,    
 * pursuant to article 5.3.4 of the CeCILL v.2.1.                       
 * This file was originally licensed under the terms of the CeCILL v2.1,
 * and continues to be available under such terms.                      
 * For more information, see the COPYING file which you should have received
 * along with this program.                                             
 *                                                                      
 */ 

#include "mex.h"

double sum_(double *array, int size){                               

    double ans = 0;
    int i;
    for(i = 0; i<size; i++){
        ans += array[i];
    }

    return ans;
}

double avg_(double *array, int size){

    return (sum_(array, size)/size);
}

double min_(double *array, int size){

    double ans = array[0];
    int i;

    for(i = 1; i<size; i++)
        ans = ans > array[i]? array[i] : ans;

    return ans;
}


double max_(double *array, int size){

    double ans = array[0];
    int i;

    for(i = 1; i<size; i++)
        ans = ans < array[i]? array[i] : ans;

    return ans;
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])
{
    int nDims = 0;
    int iSize = 0;
    double *data_in;
    double *pdbl = NULL;

    mxArray* pOut = NULL;

    if(nrhs < 1)
    {
        mexErrMsgTxt("Need at least one input argument");
    }

    nDims = mxGetNumberOfDimensions(prhs[0]);

    int *dims = mxGetDimensions(prhs[0]);
    iSize = mxGetNumberOfElements(prhs[0]);
    data_in = mxGetPr(prhs[0]);
    pOut = mxCreateDoubleMatrix(1, 4, mxREAL);
    pdbl = mxGetPr(pOut);

    double ans[4];
    ans[0] = sum_(data_in, iSize);
    ans[1] = avg_(data_in, iSize);
    ans[2] = max_(data_in, iSize);
    ans[3] = min_(data_in, iSize);
    
    int i;
    for(i = 0; i<4; i++)
        pdbl[i] = ans[i];

    plhs[0] = pOut;
}

