#ifndef _RISCV_H_
#define _RISCV_H_

#include "types.h"

/*  I use volatile keyward to prevent
    the specified instruction from being omitted
*/

static uint64 read_mhartid(){
    uint64 x;
    asm volatile("csrr %0, mhartid" : "=r" (x));
    return x;
}

#endif