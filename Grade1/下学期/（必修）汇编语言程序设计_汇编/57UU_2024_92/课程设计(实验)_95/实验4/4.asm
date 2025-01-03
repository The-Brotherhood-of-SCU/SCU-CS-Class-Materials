DATAS SEGMENT
    VARB DB 14,-25,66,-17,78,-33,46,-96,71,80
 	LEN EQU $-VARB;数组长度
    ODDNUM DB 0
    EVENNUM DB 0
DATAS ENDS

STACKS SEGMENT
    
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    
    MOV CX,LEN;VARB的长度
    LEA BX,VARB;VARB的地址
LOOP_START:
	MOV AH,[BX]
	ADD AH,0;改变标志位SF
	JNS POSITIVE
	NEG AH;不是正数的话就取反
POSITIVE:
	SAR AH,1;将最低位取出到CF中
	JC ODD_NUM
EVEN_NUM:
	INC EVENNUM;偶数
	JMP FINISH;跳转到结束，避免增加偶数计数
ODD_NUM:
	INC ODDNUM;奇数
FINISH:
	
	INC BX;地址位+1，指向下一个数字
	LOOP LOOP_START;循环对每一个数字分析
    
    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START