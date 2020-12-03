//
//  test_fun.s
//  11_24_ios_oc
//
//  Created by delims on 2020/11/24.
//

; test_fun.s
.section __TEXT,__text,regular,pure_instructions
.ios_version_min 11, 2
.p2align 2


.global _double_num_times_asm
_double_num_times_asm:
    lsl x0, x0, x1
    mov x0, #0xf
    and x1, x0,#0xff
    mov x0, #0x7
    orr x1, x0 ,#0x7
    mov x2, #0x5
    eor x1, x0 ,x2

    ldr x0,[x30,0x8]
    ldp x27,x14, [sp,0x0]
    mov x0,x24
    mov x2,x27

    ret

