/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: ert_main.c
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
#include "MW_target_hardware_resources.h"

volatile int IsrOverrun = 0;
static boolean_T OverrunFlag = 0;
void rt_OneStep(void)
{
  /* Check for overrun. Protect OverrunFlag against preemption */
  if (OverrunFlag++) {
    IsrOverrun = 1;
    OverrunFlag--;
    return;
  }

  __enable_irq();
  untitled_step();

  /* Get model outputs here */
  __disable_irq();
  OverrunFlag--;
}

volatile boolean_T stopRequested;
volatile boolean_T runModel;
int main(void)
{
  float modelBaseRate = 0.2;
  float systemClock = 48;

  /* Initialize variables */
  stopRequested = false;
  runModel = false;
  BoardInit();
  rtmSetErrorStatus(untitled_M, 0);
  untitled_initialize();

#ifdef EXT_MODE

  wait_ms(1000);

#endif

  (void) systemClock;
  ARMCM_SysTick_Config(modelBaseRate);
  runModel = rtmGetErrorStatus(untitled_M) == (NULL);
  __enable_irq();
  while (runModel) {
    stopRequested = !(rtmGetErrorStatus(untitled_M) == (NULL));
    runModel = !(stopRequested);
  }

  /* Terminate model */
  untitled_terminate();

#ifdef EXT_MODE

  wait_ms(1000);

#endif

  (void) systemClock;
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
