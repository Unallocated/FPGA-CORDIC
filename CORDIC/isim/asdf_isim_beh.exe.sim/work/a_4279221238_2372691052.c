/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/main/git/FPGA-CORDIC/CORDIC/asdf.vhd";
extern char *STD_TEXTIO;
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3564397177;

char *ieee_p_2592010699_sub_16439989833707593767_503743352(char *, char *, char *, char *, char *, char *);
void ieee_p_3564397177_sub_2250825304603680424_91900896(char *, char *, char *, char *, char *, unsigned char , int );
int ieee_p_3620187407_sub_5109402382352621412_3965413181(char *, char *, char *);


static void work_a_4279221238_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3928);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 4800);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3928);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_4279221238_2372691052_p_1(char *t0)
{
    char t19[16];
    char t21[16];
    char t23[8];
    char t24[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned char t16;
    int64 t17;
    unsigned char t18;
    unsigned int t20;
    int t22;

LAB0:    t1 = (t0 + 4368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 4864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t2 = (t0 + 4176);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 2728U);
    t3 = *((char **)t2);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t8 = *((int *)t4);
    t9 = (t8 - 0);
    t10 = (t9 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t8);
    t11 = (8U * t10);
    t12 = (0 + t11);
    t2 = (t3 + t12);
    t5 = (t0 + 4928);
    t6 = (t5 + 56U);
    t13 = *((char **)t6);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t8 = *((int *)t3);
    t16 = (t8 == 255);
    if (t16 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t8 = *((int *)t3);
    t9 = (t8 + 1);
    t2 = (t0 + 4992);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t13 = *((char **)t6);
    *((int *)t13) = t9;
    xsi_driver_first_trans_fast(t2);

LAB9:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t2 = (t0 + 4176);
    xsi_process_wait(t2, t7);

LAB17:    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(145, ng0);

LAB13:    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB11:    goto LAB9;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

LAB15:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 4864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t17 = (t7 * 3);
    t2 = (t0 + 4176);
    xsi_process_wait(t2, t17);

LAB21:    *((char **)t1) = &&LAB22;
    goto LAB1;

LAB16:    goto LAB15;

LAB18:    goto LAB16;

LAB19:    xsi_set_current_line(152, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t8 = (7 - 7);
    t10 = (t8 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t2 = (t3 + t12);
    t16 = *((unsigned char *)t2);
    t18 = (t16 == (unsigned char)3);
    if (t18 != 0)
        goto LAB23;

LAB25:    xsi_set_current_line(156, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3472U);
    t4 = (t0 + 10484);
    t6 = (t19 + 0U);
    t13 = (t6 + 0U);
    *((int *)t13) = 1;
    t13 = (t6 + 4U);
    *((int *)t13) = 8;
    t13 = (t6 + 8U);
    *((int *)t13) = 1;
    t8 = (8 - 1);
    t10 = (t8 * 1);
    t10 = (t10 + 1);
    t13 = (t6 + 12U);
    *((unsigned int *)t13) = t10;
    std_textio_write7(STD_TEXTIO, t2, t3, t4, t19, (unsigned char)0, 0);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 8128U);
    t8 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t3, t2);
    t9 = (t8 + 64);
    t4 = (t0 + 2968U);
    t5 = *((char **)t4);
    t4 = (t5 + 0);
    *((int *)t4) = t9;

LAB24:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 2968U);
    t3 = *((char **)t2);
    t8 = *((int *)t3);
    t2 = (t0 + 5056);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t13 = *((char **)t6);
    *((int *)t13) = t8;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3472U);
    t4 = (t0 + 10492);
    t6 = (t19 + 0U);
    t13 = (t6 + 0U);
    *((int *)t13) = 1;
    t13 = (t6 + 4U);
    *((int *)t13) = 1;
    t13 = (t6 + 8U);
    *((int *)t13) = 1;
    t8 = (1 - 1);
    t10 = (t8 * 1);
    t10 = (t10 + 1);
    t13 = (t6 + 12U);
    *((unsigned int *)t13) = t10;
    std_textio_write7(STD_TEXTIO, t2, t3, t4, t19, (unsigned char)0, 0);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3472U);
    t4 = (t0 + 2968U);
    t5 = *((char **)t4);
    t8 = *((int *)t5);
    std_textio_write5(STD_TEXTIO, t2, t3, t8, (unsigned char)0, 0);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3472U);
    t4 = (t0 + 10493);
    t6 = (t19 + 0U);
    t13 = (t6 + 0U);
    *((int *)t13) = 1;
    t13 = (t6 + 4U);
    *((int *)t13) = 1;
    t13 = (t6 + 8U);
    *((int *)t13) = 1;
    t8 = (1 - 1);
    t10 = (t8 * 1);
    t10 = (t10 + 1);
    t13 = (t6 + 12U);
    *((unsigned int *)t13) = t10;
    std_textio_write7(STD_TEXTIO, t2, t3, t4, t19, (unsigned char)0, 0);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3472U);
    t4 = (t0 + 2152U);
    t5 = *((char **)t4);
    t8 = *((int *)t5);
    std_textio_write5(STD_TEXTIO, t2, t3, t8, (unsigned char)0, 0);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3472U);
    t4 = (t0 + 10494);
    t6 = (t19 + 0U);
    t13 = (t6 + 0U);
    *((int *)t13) = 1;
    t13 = (t6 + 4U);
    *((int *)t13) = 1;
    t13 = (t6 + 8U);
    *((int *)t13) = 1;
    t8 = (1 - 1);
    t10 = (t8 * 1);
    t10 = (t10 + 1);
    t13 = (t6 + 12U);
    *((unsigned int *)t13) = t10;
    std_textio_write7(STD_TEXTIO, t2, t3, t4, t19, (unsigned char)0, 0);
    xsi_set_current_line(166, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3472U);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    memcpy(t23, t5, 8U);
    t4 = (t0 + 8096U);
    ieee_p_3564397177_sub_2250825304603680424_91900896(IEEE_P_3564397177, t2, t3, t23, t4, (unsigned char)0, 0);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3472U);
    t4 = (t0 + 10495);
    t6 = (t19 + 0U);
    t13 = (t6 + 0U);
    *((int *)t13) = 1;
    t13 = (t6 + 4U);
    *((int *)t13) = 1;
    t13 = (t6 + 8U);
    *((int *)t13) = 1;
    t8 = (1 - 1);
    t10 = (t8 * 1);
    t10 = (t10 + 1);
    t13 = (t6 + 12U);
    *((unsigned int *)t13) = t10;
    std_textio_write7(STD_TEXTIO, t2, t3, t4, t19, (unsigned char)0, 0);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3472U);
    t4 = (t0 + 1672U);
    t5 = *((char **)t4);
    memcpy(t24, t5, 8U);
    t4 = (t0 + 8128U);
    ieee_p_3564397177_sub_2250825304603680424_91900896(IEEE_P_3564397177, t2, t3, t24, t4, (unsigned char)0, 0);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 4176);
    t3 = (t0 + 3296U);
    t4 = (t0 + 3472U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t4);
    goto LAB2;

LAB20:    goto LAB19;

LAB22:    goto LAB20;

LAB23:    xsi_set_current_line(153, ng0);
    t4 = (t0 + 4176);
    t5 = (t0 + 3472U);
    t6 = (t0 + 10468);
    t14 = (t19 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 1;
    t15 = (t14 + 4U);
    *((int *)t15) = 8;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t9 = (8 - 1);
    t20 = (t9 * 1);
    t20 = (t20 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t20;
    std_textio_write7(STD_TEXTIO, t4, t5, t6, t19, (unsigned char)0, 0);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 8128U);
    t4 = (t0 + 10476);
    t6 = (t21 + 0U);
    t13 = (t6 + 0U);
    *((int *)t13) = 0;
    t13 = (t6 + 4U);
    *((int *)t13) = 7;
    t13 = (t6 + 8U);
    *((int *)t13) = 1;
    t8 = (7 - 0);
    t10 = (t8 * 1);
    t10 = (t10 + 1);
    t13 = (t6 + 12U);
    *((unsigned int *)t13) = t10;
    t13 = ieee_p_2592010699_sub_16439989833707593767_503743352(IEEE_P_2592010699, t19, t3, t2, t4, t21);
    t9 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t13, t19);
    t22 = (64 - t9);
    t14 = (t0 + 2968U);
    t15 = *((char **)t14);
    t14 = (t15 + 0);
    *((int *)t14) = t22;
    goto LAB24;

}


extern void work_a_4279221238_2372691052_init()
{
	static char *pe[] = {(void *)work_a_4279221238_2372691052_p_0,(void *)work_a_4279221238_2372691052_p_1};
	xsi_register_didat("work_a_4279221238_2372691052", "isim/asdf_isim_beh.exe.sim/work/a_4279221238_2372691052.didat");
	xsi_register_executes(pe);
}
