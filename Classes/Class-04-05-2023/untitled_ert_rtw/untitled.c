/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: untitled.c
 *
 * Code generated for Simulink model 'untitled'.
 *
 * Model version                  : 1.0
 * Simulink Coder version         : 9.9 (R2023a) 19-Nov-2022
 * C/C++ source code generated on : Fri Apr 14 18:59:48 2023
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "untitled.h"
#include "rtwtypes.h"
#include "untitled_private.h"
#include <math.h>

/* Block states (default storage) */
DW_untitled_T untitled_DW;

/* Real-time model */
static RT_MODEL_untitled_T untitled_M_;
RT_MODEL_untitled_T *const untitled_M = &untitled_M_;
real_T rt_roundd_snf(real_T u)
{
  real_T y;
  if (fabs(u) < 4.503599627370496E+15) {
    if (u >= 0.5) {
      y = floor(u + 0.5);
    } else if (u > -0.5) {
      y = u * 0.0;
    } else {
      y = ceil(u - 0.5);
    }
  } else {
    y = u;
  }

  return y;
}

/* Model step function */
void untitled_step(void)
{
  real_T tmp;
  real_T tmp_0;
  real_T tmp_1;
  uint8_T tmp_2;
  uint8_T tmp_3;
  uint8_T tmp_4;

  /* MATLABSystem: '<Root>/RGB LED' incorporates:
   *  Constant: '<Root>/Constant'
   *  Constant: '<Root>/Constant1'
   *  Constant: '<Root>/Constant2'
   */
  tmp = rt_roundd_snf(untitled_P.Constant_Value);
  tmp_0 = rt_roundd_snf(untitled_P.Constant1_Value);
  tmp_1 = rt_roundd_snf(untitled_P.Constant2_Value);
  if (tmp < 256.0) {
    if (tmp >= 0.0) {
      tmp_2 = (uint8_T)tmp;
    } else {
      tmp_2 = 0U;
    }
  } else {
    tmp_2 = MAX_uint8_T;
  }

  if (tmp_0 < 256.0) {
    if (tmp_0 >= 0.0) {
      tmp_3 = (uint8_T)tmp_0;
    } else {
      tmp_3 = 0U;
    }
  } else {
    tmp_3 = MAX_uint8_T;
  }

  if (tmp_1 < 256.0) {
    if (tmp_1 >= 0.0) {
      tmp_4 = (uint8_T)tmp_1;
    } else {
      tmp_4 = 0U;
    }
  } else {
    tmp_4 = MAX_uint8_T;
  }

  MW_RGBLED_Write(tmp_2, tmp_3, tmp_4);

  /* End of MATLABSystem: '<Root>/RGB LED' */
}

/* Model initialize function */
void untitled_initialize(void)
{
  /* Start for MATLABSystem: '<Root>/RGB LED' */
  untitled_DW.obj.matlabCodegenIsDeleted = false;
  untitled_DW.obj.isInitialized = 1;
  MW_RGBLED_Init();
  untitled_DW.obj.isSetupComplete = true;
}

/* Model terminate function */
void untitled_terminate(void)
{
  /* Terminate for MATLABSystem: '<Root>/RGB LED' */
  if (!untitled_DW.obj.matlabCodegenIsDeleted) {
    untitled_DW.obj.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<Root>/RGB LED' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
