DATAS SEGMENT
    YINFU4 DB  	'|**','|**','|**','|**','|**','|**','|**'
    YINFU5 DB  	'|**','|**','|**','|**','|**','|**','|**'
    YINFU6 DB  	'|**','|**','|**','|**','|**','|**','|**'
    YINFU1 DB  	'**|','**|','**|','**|','**|','**|','**|'
    YINFU2 DB  	'**|','**|','**|','**|','**|','**|','**|'
    YINFU3 DB  	'**|','**|','**|','**|','**|','**|','**|'
    ANJIAN DB 	'q   w   e   r   t   y   u   I$'
    BUF1 DB   	'KEYboard PIANO !',0AH,0DH,'$'
    BUF2 DB   	'q    w    e    r    t    y    u$'
	BUF6 DB   	'a    s    d    f    g    h    j$'
	BUF7 DB	  	'z    x    c    v    b    n    m$'
    BUF5 DB   	'DO+  RA+  MI+  FA+  SO+  LA+  XI+$'
	BUF8 DB	  	'DO   RA   MI   FA   SO   LA   XI $'  
	BUF9 DB	  	'DO-  RA-  MI-  FA-  SO-  LA-  XI-$'
    BUF3 DB   	'                                                                                $'
    BUF4 DB   	'MAKER: XUJIAMING$'
    BUF10 DB    '                                                                                $'
    BEGINS DB 	' n=NORMAL GAME           m=WATCHMEPLAY                                          $'
    ENDD DB   	'                                                   Press ESC to END!',0AH,0DH, '$'
    WE  DB    	'                            ** you can play!!!**                               $'	
    piano DB    '     ---------------------------------------------------------------            $'
    piano1 DB   '    |------------------------------------------------------------- |            $'
    piano2 DB   '    |                         welcome to play                      |            $'
    piano3 DB   '     ---------------------------------------------------------------            $'
    piano4 DB   '    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            $'
    piano5 DB   '    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            $'
    piano6 DB   '    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            $'
    piano8 DB   '    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            $'
    piano9 DB   '    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            $'
    piano10 DB  '    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           $'
    piano11 DB   '     DO+RI+MI+FA+SO+LA+XI+DO RI MI FA SO LA XI DO-RI-MI-FA-SO-LA-XI-           $'
    piano12 DB   '    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |            $'
    piano7 DB   '     ----------------------------------------------------------------            $'
    THANK DB  	'                              THANKS FOR USING $                             '
    FIR DB    	'  A  '
    SEC DB    	'  B  '
    kongge DB   '  |$'
    kongge1 DB  '|  |$'
    LEN EQU 	$-SEC
    FLAG1 DB 	0
	AI  DB    	'                            ** TWO TIGERS!!!press a**                                 $' 
DATAS ENDS

STACKS SEGMENT 
    DB 100 DUP(0)
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS,ES:DATAS
START:
	MOV AL,03H
    MOV AH,00H
    INT 10H
    MOV AX,DATAS
    MOV DS,AX
    MOV ES,AX
    MOV AL,25D
    MOV BH,00001110B
    MOV CH,0
    MOV CL,0
    MOV DH,24
    MOV DL,79
    MOV AH,06H
    INT 10H
    LEA DX,BUF1
    MOV AH,09H
    INT 21H
    LEA DX,BEGINS
    MOV AH,09H
    INT 21H
    LEA DX,ENDD
    MOV AH,09H
    INT 21H
    LEA DX,BUF3
    MOV AH,09H
    INT 21H
    MOV BH,0
    MOV DH,15
    MOV DL,5
    MOV AH,02H						
    INT 10H
    LEA DX,BUF2
    MOV AH,09H
    INT 21H
    MOV BH,0
    MOV DH,16
    MOV DL,5
    MOV AH,02H
    INT 10H
    LEA DX,BUF5
    MOV AH,09H
    INT 21H
	MOV BH,0
    MOV DH,17
    MOV DL,5
    MOV AH,02H									
    INT 10H
    LEA DX,BUF6
    MOV AH,09H
    INT 21H
    MOV BH,0
    MOV DH,18
    MOV DL,5
    MOV AH,02H
    INT 10H
    LEA DX,BUF8
    MOV AH,09H
    INT 21H
	MOV BH,0	
    MOV DH,19
    MOV DL,5
    MOV AH,02H			
    INT 10H
    LEA DX,BUF7
    MOV AH,09H
    INT 21H
    MOV BH,0
    MOV DH,20
    MOV DL,5
    MOV AH,02H
    INT 10H
    LEA DX,BUF9
    MOV AH,09H
    INT 21H
    MOV AH,08H
    INT 21H
    MOV AH,0					;¶Á¼üÅÌ
    INT 16H
    CMP AL,'n'
    JZ KAISHI
    CMP AL,'m'
    JZ WATCHMEPLAY
WATCHMEPLAY:
    MOV AL,1
    MOV AH,05H
    INT 10H
    MOV AL,25D
    MOV BH,00010100B
    MOV CH,0
    MOV CL,0
    MOV DH,30
    MOV DL,79
    MOV AH,06H
    INT 10H
    LEA DX,AI
    MOV AH,09H
    INT 21H
	LEA DX,piano
    MOV AH,09H
    INT 21H
    LEA DX,piano1
    MOV AH,09H
    INT 21H
    LEA DX,piano2
    MOV AH,09H
    INT 21H
    LEA DX,piano3
    MOV AH,09H
    INT 21H
    LEA DX,piano4
    MOV AH,09H
    INT 21H
    LEA DX,piano5
    MOV AH,09H
    INT 21H
    LEA DX,piano6
    MOV AH,09H
    INT 21H
    LEA DX,piano8
    MOV AH,09H
    INT 21H
    LEA DX,piano9
    MOV AH,09H
    INT 21H
    LEA DX,piano10
    MOV AH,09H
    INT 21H
    LEA DX,piano7
    MOV AH,09H
    INT 21H
    LEA DX,piano11
    MOV AH,09H
    INT 21H
    CALL SANG                   ;call SANG
SANG PROC
LIU:
	CMP AL,'a'
    JZ Ax1
	MOV AH,0
    INT 16H
	CMP AL,1BH
    JZ EXIT
    CMP AL,'1'
    JZ START
Ax1: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,988
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,21
    MOV CX,3
    LEA SI,YINFU5
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax2
Ax2:	
	MOV AL,0B6H
	OUT 43H,AL 
	MOV AX,880
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,24
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,3
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax3
Ax3: 
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,784
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,27
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,6
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax4
Ax4: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,988
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,21
    MOV CX,3
    LEA SI,YINFU5
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax5
Ax5: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,988
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,21
    MOV CX,3
    LEA SI,YINFU5
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax6
Ax6:	
	MOV AL,0B6H
	OUT 43H,AL 
	MOV AX,880
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,24
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,3
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax7
Ax7: 
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,784
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,27
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,6
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax8
Ax8: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,988
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,21
    MOV CX,3
    LEA SI,YINFU5
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax9
Ax9: 
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,784
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,27
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,6
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	MOV AL,'f'
	JZ Ax10
Ax10:	
	MOV AL,0B6H
	OUT 43H,AL 	
	MOV AX,698
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,30
    MOV CX,3
    LEA SI,YINFU5
	ADD SI,9
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax11
Ax11: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,659
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,33
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,12
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax12
Ax12: 
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,784
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,27
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,6
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	MOV AL,'f'
	JZ Ax13
Ax13:	
	MOV AL,0B6H
	OUT 43H,AL 	
	MOV AX,698
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,30
    MOV CX,3
    LEA SI,YINFU5
	ADD SI,9
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	JZ Ax14
Ax14: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,659
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,33
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,12
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR
	JMP Ax15
Ax15: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,659
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,33
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,12
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax16
Ax16: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,587
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,36
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,15
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax17
Ax17: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,659
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,33
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,12
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax18
Ax18:	
	MOV AL,0B6H
	OUT 43H,AL 	
	MOV AX,698
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,30
    MOV CX,3
    LEA SI,YINFU5
	ADD SI,9
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax19
Ax19: 
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,784
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,27
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,6
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	MOV AL,'f'
	jmp Ax20
Ax20: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,988
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,21
    MOV CX,3
    LEA SI,YINFU5
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax21

	
	

Ax21: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,659
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,33
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,12
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax22
Ax22: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,587
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,36
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,15
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax23
Ax23: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,659
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,33
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,12
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax24
Ax24:	
	MOV AL,0B6H
	OUT 43H,AL 	
	MOV AX,698
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,30
    MOV CX,3
    LEA SI,YINFU5
	ADD SI,9
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax25
Ax25: 
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,784
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,27
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,6
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	MOV AL,'f'
	jmp Ax26
Ax26: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,988
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,21
    MOV CX,3
    LEA SI,YINFU5
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax27
Ax27:	
	MOV AL,0B6H
	OUT 43H,AL 
	MOV AX,880
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,24
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,3
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax28
Ax28: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,1319
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,54
    MOV CX,3
    LEA SI,YINFU6
    ADD SI,12
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax29
Ax29: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,988
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,21
    MOV CX,3
    LEA SI,YINFU5
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	MOV AL,'s'
	jmp Ax30
Ax30:	
	MOV AL,0B6H
	OUT 43H,AL 
	MOV AX,880
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,24
    MOV CX,3
    LEA SI,YINFU5
    ADD SI,3
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	MOV AL,'d'
	jmp Ax31
Ax31: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,1319
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,54
    MOV CX,3
    LEA SI,YINFU6
    ADD SI,12
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp Ax32
Ax32: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,988
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,21
    MOV CX,3
    LEA SI,YINFU5
    CALL YIN
    IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	CALL CLEAR1
	jmp START
SANG ENDP

KAISHI:
    MOV AL,1
    MOV AH,05H
    INT 10H
    MOV AL,25D
    MOV BH,00010100B
    MOV CH,0
    MOV CL,0
    MOV DH,30
    MOV DL,79
    MOV AH,06H
    INT 10H
    LEA DX,WE
    MOV AH,09H
    INT 21H
	LEA DX,piano
    MOV AH,09H
    INT 21H
    LEA DX,piano1
    MOV AH,09H
    INT 21H
    LEA DX,piano2
    MOV AH,09H
    INT 21H
    LEA DX,piano3
    MOV AH,09H
    INT 21H
    LEA DX,piano4
    MOV AH,09H
    INT 21H
    LEA DX,piano5
    MOV AH,09H
    INT 21H
    LEA DX,piano6
    MOV AH,09H
    INT 21H
    LEA DX,piano8
    MOV AH,09H
    INT 21H
    LEA DX,piano9
    MOV AH,09H
    INT 21H
    LEA DX,piano10
    MOV AH,09H
    INT 21H
    LEA DX,piano7
    MOV AH,09H
    INT 21H
    LEA DX,piano11
    MOV AH,09H
    INT 21H
    MOV DX,0
    CALL SONG
SONG PROC
WU: 
	call clear
	MOV AH,0					;¶Á¼üÅÌ
    INT 16H
	CMP AL,'q'
    JZ A1
    CMP AL,'w'
    JZ B1
    CMP AL,'e'
    JZ C1
    CMP AL,'r'
    JZ D1
    CMP AL,'t'
    JZ E1
    CMP AL,'y'
    JZ F1
    CMP AL,'u'
    JZ G1
	CMP AL,'a'
    JZ A2
    CMP AL,'s'
    JZ B2
    CMP AL,'d'
    JZ C2
    CMP AL,'f'
    JZ D2
    CMP AL,'g'
    JZ E2
    CMP AL,'h'
    JZ F2
    CMP AL,'j'
    JZ G2
	CMP AL,'z'
    JZ A3
    CMP AL,'x'
    JZ B3
    CMP AL,'c'
    JZ C3
    CMP AL,'v'
    JZ D3
    CMP AL,'b'
    JZ E3
    CMP AL,'n'
    JZ F3
    CMP AL,'m'
    JZ G3
	CMP AL,1BH
    JZ EXIT
    JMP WU
A1: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,494
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
	MOV DL,0
    MOV CX,3
    LEA SI,YINFU2
    CALL YIN
    JMP MA
B1:	
	MOV AL,0B6H
	OUT 43H,AL 
	MOV AX,440
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,3
    MOV CX,3
    LEA SI,YINFU2
    ADD SI,3
    CALL YIN
    JMP MA
C1: 
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,392
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,6
    MOV CX,3
    LEA SI,YINFU2
    ADD SI,6
    CALL YIN
    JMP MA
D1:	
	MOV AL,0B6H
	OUT 43H,AL 	
	MOV AX,349
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,9
    MOV CX,3
    LEA SI,YINFU2
	ADD SI,9
    CALL YIN
    JMP MA
E1: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,330
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,12
    MOV CX,3
    LEA SI,YINFU2
    ADD SI,12
    CALL YIN
    JMP MA
F1: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,294
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,15
    MOV CX,3
    LEA SI,YINFU2
    ADD SI,15
    CALL YIN
    JMP MA
G1: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,262
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,18
    MOV CX,3
    LEA SI,YINFU2
    ADD SI,18
    CALL YIN
    JMP MA
A2: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,988
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,21
    MOV CX,3
    LEA SI,YINFU1
    CALL YIN
    JMP MA
B2:	
	MOV AL,0B6H
	OUT 43H,AL 
	MOV AX,880
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,24
    MOV CX,3
    LEA SI,YINFU1
    ADD SI,3
    CALL YIN
    JMP MA
C2: 
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,784
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,27
    MOV CX,3
    LEA SI,YINFU1
    ADD SI,6
    CALL YIN
    JMP MA
D2:	
	MOV AL,0B6H
	OUT 43H,AL 	
	MOV AX,698
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,30
    MOV CX,3
    LEA SI,YINFU1
	ADD SI,9
    CALL YIN
    JMP MA
E2: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,659
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,33
    MOV CX,3
    LEA SI,YINFU1
    ADD SI,12
    CALL YIN
    JMP MA
F2: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,587
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,36
    MOV CX,3
    LEA SI,YINFU1
    ADD SI,15
    CALL YIN
    JMP MA
G2: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,523
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,39
    MOV CX,3
    LEA SI,YINFU1
    ADD SI,18
    CALL YIN
    JMP MA
A3: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,1967
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,42
    MOV CX,3
    LEA SI,YINFU3
    CALL YIN
    JMP MA
B3:	
	MOV AL,0B6H
	OUT 43H,AL 
	MOV AX,1760
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,45
    MOV CX,3
    LEA SI,YINFU3
    ADD SI,3
    CALL YIN
    JMP MA
C3: 
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,1568
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,48
    MOV CX,3
    LEA SI,YINFU3
    ADD SI,6
    CALL YIN
    JMP MA
D3:	
	MOV AL,0B6H
	OUT 43H,AL 	
	MOV AX,1397
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,51
    MOV CX,3
    LEA SI,YINFU3
	ADD SI,9
    CALL YIN
    JMP MA
E3: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,1319
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,54
    MOV CX,3
    LEA SI,YINFU3
    ADD SI,12
    CALL YIN
    JMP MA
F3: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,1175
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,57
    MOV CX,3
    LEA SI,YINFU3
    ADD SI,15
    CALL YIN
    JMP MA
G3: 	
	MOV AL,0B6H
	OUT 43H,AL
	MOV AX,1047
    OUT 42H,AL
    MOV AL,AH
    OUT 42H,AL
    MOV DL,60
    MOV CX,3
    LEA SI,YINFU3
    ADD SI,18
    CALL YIN
    JMP MA
MA: IN AL,61H
    OR AL,3
    OUT 61H,AL
 	CALL DELAY
    IN AL,61H
    AND AL,0FCH
    OUT 61H,AL
	jmp WU
SONG ENDP
DELAY PROC
			PUSH 	BX
			PUSH 	CX
			MOV 	BX,800
	DY1:	mov		cx,0500H
	DY0:	LOOP	DY0
			DEC		BX
			JNZ		DY1
			
			POP		CX
			POP		BX
			RET
DELAY ENDP
EXIT:
    MOV AL,2
    MOV AH,05H
    INT 10H
    MOV AL,25D
    MOV BH,0000111B
    MOV CH,0
    MOV CL,0
    MOV DH,24
    MOV DL,79
    MOV AH,06H
    INT 10H

    MOV AH,0
    LEA DX,THANK
    MOV AH,09H
    INT 21H
    MOV BH,2
    MOV DH,21
    MOV DL,50
    MOV AH,02H
    INT 10H
    LEA DX,BUF4
    MOV AH,09H
    INT 21H

    MOV AL,0
    OUT 61H,AL
    MOV AH,4CH
    INT 21H
    RET
YIN PROC
    ADD DL,4
    LOP1:
    MOV BH,1
    MOV DH,10
    MOV AH,02H
    INT 10H
    PUSH DX
    MOV DL,[SI]
    MOV AH,2
    INT 21H
    INC SI
    POP DX
    INC DL
    LOOP LOP1
    RET
YIN ENDP
CLEAR PROC
    SUB DL,3
    MOV CX,3
    LEA SI,kongge
    LOP2:
    MOV BH,1
    MOV DH,10
    MOV AH,02H
    INT 10H
    PUSH DX
    MOV DL,[SI]
    MOV AH,2
    INT 21H
    INC SI
    POP DX
    INC DL
    LOOP LOP2
    RET
CLEAR ENDP
CLEAR1 PROC
    SUB DL,3
    MOV CX,3
    LEA SI,kongge1
    LOP2:
    MOV BH,1
    MOV DH,10
    MOV AH,02H
    INT 10H
    PUSH DX
    MOV DL,[SI]
    MOV AH,2
    INT 21H
    INC SI
    POP DX
    INC DL
    LOOP LOP2
    RET
CLEAR1 ENDP


CODES ENDS
END START






















