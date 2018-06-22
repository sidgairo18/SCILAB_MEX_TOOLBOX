#ifdef MEX

#include <mex.h>
#include <iostream>
#include <cstddef>
// Get image from clipboard as an RGB image
//
// Outputs:
//   IM  h*w*c list of rgb pixel color values as uint8, running over height,
//     then width, then rgb channels
//   h  height
//   w  width
//   c  channels
bool paste(unsigned char *& IM,size_t & h, size_t & w, size_t & c);

void mexFunction(
  int nlhs, mxArray *plhs[], 
  int nrhs, const mxArray *prhs[])
{
  unsigned char * IM;
  size_t h,w,c;
  if(!paste(IM,h,w,c))
  {
    mexErrMsgTxt("Clipboard doesn't contain image.");
  }
  switch(nlhs)
  {
    default:
    {
      mexErrMsgTxt("Too many output parameters.");
    }
    case 1:
    {
      size_t dims[] = {h,w,c};
      plhs[0] = mxCreateNumericArray(3,dims,mxUINT8_CLASS,mxREAL);
      unsigned char * IMp = (unsigned char *)mxGetData(plhs[0]);
      std::copy(IM,IM+w*h*c,IMp);
      // Fall through
    }
    case 0: break;
  }
}

#endif

