#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/TP5_FreeRTOS_AvecOs.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/TP5_FreeRTOS_AvecOs.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c ../src/system_config/default/system_interrupt_a.S ../src/system_config/default/rtos_hooks.c ../src/apptemp.c ../src/applcd.c ../src/main.c ../src/Mc32SpiUtil.c ../src/Mc32gestSPiLM70.c ../../../../../bsp/pic32mx_skes/bsp.c ../../../../../bsp/pic32mx_skes/Mc32Delays.c ../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c ../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c ../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c ../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c ../../../../../framework/osal/src/osal_freertos.c ../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S ../../../../../third_party/rtos/FreeRTOS/Source/croutine.c ../../../../../third_party/rtos/FreeRTOS/Source/list.c ../../../../../third_party/rtos/FreeRTOS/Source/queue.c ../../../../../third_party/rtos/FreeRTOS/Source/tasks.c ../../../../../third_party/rtos/FreeRTOS/Source/timers.c ../../../../../third_party/rtos/FreeRTOS/Source/event_groups.c ../../../../../third_party/rtos/FreeRTOS/Source/stream_buffer.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o ${OBJECTDIR}/_ext/1688732426/rtos_hooks.o ${OBJECTDIR}/_ext/1360937237/apptemp.o ${OBJECTDIR}/_ext/1360937237/applcd.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o ${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o ${OBJECTDIR}/_ext/2048899216/bsp.o ${OBJECTDIR}/_ext/2048899216/Mc32Delays.o ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o ${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o ${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o ${OBJECTDIR}/_ext/308321468/osal_freertos.o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ${OBJECTDIR}/_ext/1107379230/heap_1.o ${OBJECTDIR}/_ext/1282498059/port.o ${OBJECTDIR}/_ext/1282498059/port_asm.o ${OBJECTDIR}/_ext/373060831/croutine.o ${OBJECTDIR}/_ext/373060831/list.o ${OBJECTDIR}/_ext/373060831/queue.o ${OBJECTDIR}/_ext/373060831/tasks.o ${OBJECTDIR}/_ext/373060831/timers.o ${OBJECTDIR}/_ext/373060831/event_groups.o ${OBJECTDIR}/_ext/373060831/stream_buffer.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d ${OBJECTDIR}/_ext/1688732426/system_init.o.d ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.d ${OBJECTDIR}/_ext/1688732426/rtos_hooks.o.d ${OBJECTDIR}/_ext/1360937237/apptemp.o.d ${OBJECTDIR}/_ext/1360937237/applcd.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o.d ${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o.d ${OBJECTDIR}/_ext/2048899216/bsp.o.d ${OBJECTDIR}/_ext/2048899216/Mc32Delays.o.d ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o.d ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o.d ${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o.d ${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o.d ${OBJECTDIR}/_ext/308321468/osal_freertos.o.d ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d ${OBJECTDIR}/_ext/1107379230/heap_1.o.d ${OBJECTDIR}/_ext/1282498059/port.o.d ${OBJECTDIR}/_ext/1282498059/port_asm.o.d ${OBJECTDIR}/_ext/373060831/croutine.o.d ${OBJECTDIR}/_ext/373060831/list.o.d ${OBJECTDIR}/_ext/373060831/queue.o.d ${OBJECTDIR}/_ext/373060831/tasks.o.d ${OBJECTDIR}/_ext/373060831/timers.o.d ${OBJECTDIR}/_ext/373060831/event_groups.o.d ${OBJECTDIR}/_ext/373060831/stream_buffer.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o ${OBJECTDIR}/_ext/1688732426/rtos_hooks.o ${OBJECTDIR}/_ext/1360937237/apptemp.o ${OBJECTDIR}/_ext/1360937237/applcd.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o ${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o ${OBJECTDIR}/_ext/2048899216/bsp.o ${OBJECTDIR}/_ext/2048899216/Mc32Delays.o ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o ${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o ${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o ${OBJECTDIR}/_ext/308321468/osal_freertos.o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ${OBJECTDIR}/_ext/1107379230/heap_1.o ${OBJECTDIR}/_ext/1282498059/port.o ${OBJECTDIR}/_ext/1282498059/port_asm.o ${OBJECTDIR}/_ext/373060831/croutine.o ${OBJECTDIR}/_ext/373060831/list.o ${OBJECTDIR}/_ext/373060831/queue.o ${OBJECTDIR}/_ext/373060831/tasks.o ${OBJECTDIR}/_ext/373060831/timers.o ${OBJECTDIR}/_ext/373060831/event_groups.o ${OBJECTDIR}/_ext/373060831/stream_buffer.o

# Source Files
SOURCEFILES=../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c ../src/system_config/default/system_interrupt_a.S ../src/system_config/default/rtos_hooks.c ../src/apptemp.c ../src/applcd.c ../src/main.c ../src/Mc32SpiUtil.c ../src/Mc32gestSPiLM70.c ../../../../../bsp/pic32mx_skes/bsp.c ../../../../../bsp/pic32mx_skes/Mc32Delays.c ../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c ../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c ../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c ../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c ../../../../../framework/osal/src/osal_freertos.c ../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S ../../../../../third_party/rtos/FreeRTOS/Source/croutine.c ../../../../../third_party/rtos/FreeRTOS/Source/list.c ../../../../../third_party/rtos/FreeRTOS/Source/queue.c ../../../../../third_party/rtos/FreeRTOS/Source/tasks.c ../../../../../third_party/rtos/FreeRTOS/Source/timers.c ../../../../../third_party/rtos/FreeRTOS/Source/event_groups.c ../../../../../third_party/rtos/FreeRTOS/Source/stream_buffer.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/TP5_FreeRTOS_AvecOs.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o: ../src/system_config/default/system_interrupt_a.S  .generated_files/flags/default/3354fdfc021879c748c38ced5363c739893e56ce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.ok ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../src/system_config/default" -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.d"  -o ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o ../src/system_config/default/system_interrupt_a.S  -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1,-I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../src/system_config/default" 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.d" "${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1282498059/port_asm.o: ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/d7b220d079b661fe6d8704a3f1e3e3bdfba6310f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1282498059" 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port_asm.o.ok ${OBJECTDIR}/_ext/1282498059/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../src/system_config/default" -MMD -MF "${OBJECTDIR}/_ext/1282498059/port_asm.o.d"  -o ${OBJECTDIR}/_ext/1282498059/port_asm.o ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1282498059/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1,-I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../src/system_config/default" 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1282498059/port_asm.o.d" "${OBJECTDIR}/_ext/1282498059/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o: ../src/system_config/default/system_interrupt_a.S  .generated_files/flags/default/ff8497f95af0bd96124a010e91ddff44f657bd57 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.ok ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../src/system_config/default" -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.d"  -o ${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o ../src/system_config/default/system_interrupt_a.S  -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.asm.d",--gdwarf-2,-I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../src/system_config/default" 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.d" "${OBJECTDIR}/_ext/1688732426/system_interrupt_a.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1282498059/port_asm.o: ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/34a5f61c77f902f2177088d1e076aa9b95c111dc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1282498059" 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port_asm.o.ok ${OBJECTDIR}/_ext/1282498059/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../src/system_config/default" -MMD -MF "${OBJECTDIR}/_ext/1282498059/port_asm.o.d"  -o ${OBJECTDIR}/_ext/1282498059/port_asm.o ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1282498059/port_asm.o.asm.d",--gdwarf-2,-I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../src/system_config/default" 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1282498059/port_asm.o.d" "${OBJECTDIR}/_ext/1282498059/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/flags/default/b704c346edce7fc74e4e096227a3f7e68c938c5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/flags/default/f7ed30bcf3eb0eeda2678a68b35dc255761b2a9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/flags/default/fd1aaf850752b3690b46ab1658a830a8e434416e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c  .generated_files/flags/default/a6a59a2a75a61317f31ba2e971ae297ee3714f32 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/flags/default/92ab39ce52f5325bab7d79ebe56eae3b582e51bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/flags/default/2590bd57f5970a88a35f8b69b1510daa102d75a5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/default/715f1731d42f648d3dc9772423d8808a36d961c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/flags/default/730c6ed61f0834fb5c66dedd0cf142b335635bed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/default/1d6134bcc5c9a447c97f715daafc235988730836 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/flags/default/3ba08238cf5c4affae0639f68aaf640c5dac92c8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/flags/default/4398e685ae1b19c8f92539603ffaa7264d3e6dc7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  .generated_files/flags/default/c522a997ad7511501abca3e24e448ad29422bb57 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/flags/default/3c6dcca4d090ef0b97856050fd5476c43dd4eb89 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/rtos_hooks.o: ../src/system_config/default/rtos_hooks.c  .generated_files/flags/default/79e10f801df95233884eabcb704296309f0b7228 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/rtos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/rtos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/rtos_hooks.o.d" -o ${OBJECTDIR}/_ext/1688732426/rtos_hooks.o ../src/system_config/default/rtos_hooks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/apptemp.o: ../src/apptemp.c  .generated_files/flags/default/234e8e7391dcfc13b9c4c6950949dc864d1348fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/apptemp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/apptemp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/apptemp.o.d" -o ${OBJECTDIR}/_ext/1360937237/apptemp.o ../src/apptemp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/applcd.o: ../src/applcd.c  .generated_files/flags/default/449feb3ab8e647a8f7cf9434bdfc07b5c4fb57aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/applcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/applcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/applcd.o.d" -o ${OBJECTDIR}/_ext/1360937237/applcd.o ../src/applcd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/3c34b936c881dd73115ec05a4b866bceba3a48f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o: ../src/Mc32SpiUtil.c  .generated_files/flags/default/72f0679a0766b56dbd8dbbc82cb8cf2ea152258 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o ../src/Mc32SpiUtil.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o: ../src/Mc32gestSPiLM70.c  .generated_files/flags/default/6435b2b6e41e5179298500177c6774e37d53ecde .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o ../src/Mc32gestSPiLM70.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/bsp.o: ../../../../../bsp/pic32mx_skes/bsp.c  .generated_files/flags/default/14c7dc3386fcdcc0b67e3f2be94b7c88b56d5279 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/bsp.o.d" -o ${OBJECTDIR}/_ext/2048899216/bsp.o ../../../../../bsp/pic32mx_skes/bsp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32Delays.o: ../../../../../bsp/pic32mx_skes/Mc32Delays.c  .generated_files/flags/default/9452090cc61c7054cc6c52db6946ab0d37cff62f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32Delays.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32Delays.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32Delays.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32Delays.o ../../../../../bsp/pic32mx_skes/Mc32Delays.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o: ../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c  .generated_files/flags/default/fb32c2488da227027daaba8cd16d9b0e61ec3795 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o ../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o: ../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c  .generated_files/flags/default/cf796d35ab4975cee408de71ba14afd36958f890 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o ../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o: ../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c  .generated_files/flags/default/fbea4bea83c0854a99028b31b56c2faa30ef4855 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o ../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o: ../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c  .generated_files/flags/default/552b59a5c36fbbcc8ccf88ea0dbc7c50894b1170 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o ../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/308321468/osal_freertos.o: ../../../../../framework/osal/src/osal_freertos.c  .generated_files/flags/default/309730f4709ae358357db65379cfa3dda4b19f51 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/308321468" 
	@${RM} ${OBJECTDIR}/_ext/308321468/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/308321468/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308321468/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/308321468/osal_freertos.o ../../../../../framework/osal/src/osal_freertos.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/default/b92a36e063e59c3f483007db66a36b5a3b15571 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1107379230/heap_1.o: ../../../../../third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/default/e460c22fe7140bf9c3cc8d2cad0ca8038a4e3b74 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1107379230" 
	@${RM} ${OBJECTDIR}/_ext/1107379230/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1107379230/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1107379230/heap_1.o.d" -o ${OBJECTDIR}/_ext/1107379230/heap_1.o ../../../../../third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1282498059/port.o: ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/53b641793be1198e7d653015a70ea32e68715895 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1282498059" 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1282498059/port.o.d" -o ${OBJECTDIR}/_ext/1282498059/port.o ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/croutine.o: ../../../../../third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/default/b2b61cd225a23ed72c2981bada299c75192dc749 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/croutine.o.d" -o ${OBJECTDIR}/_ext/373060831/croutine.o ../../../../../third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/list.o: ../../../../../third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/default/1c89b9d9740d2fc6d6fa0f2323e16a1eb40491b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/list.o.d" -o ${OBJECTDIR}/_ext/373060831/list.o ../../../../../third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/queue.o: ../../../../../third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/default/d88848102bd88c27155b67c0acf9289269a97195 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/queue.o.d" -o ${OBJECTDIR}/_ext/373060831/queue.o ../../../../../third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/tasks.o: ../../../../../third_party/rtos/FreeRTOS/Source/tasks.c  .generated_files/flags/default/7da1ee882b018a999a9b784b36c9b34665ce639b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/tasks.o.d" -o ${OBJECTDIR}/_ext/373060831/tasks.o ../../../../../third_party/rtos/FreeRTOS/Source/tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/timers.o: ../../../../../third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/default/798f31b536b6ab80075956ddf0034a7b925053ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/timers.o.d" -o ${OBJECTDIR}/_ext/373060831/timers.o ../../../../../third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/event_groups.o: ../../../../../third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/default/c4edc8ef8748997159b8a2479358c08d21afdcb3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/event_groups.o.d" -o ${OBJECTDIR}/_ext/373060831/event_groups.o ../../../../../third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/stream_buffer.o: ../../../../../third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/default/cd0b2d570edac755291cfc90dc5cd3aa8c1381c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/373060831/stream_buffer.o ../../../../../third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/flags/default/3ebf1f857db24fead6e63dc5f0598ca472315023 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/flags/default/3b72a7e2a2e8ed72db9413c063a1fbe18d96ff1a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/flags/default/5b84c2009644e670e73bf3a09aaa704098d6893a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c  .generated_files/flags/default/9e9ee4192090dbe754f8245829d6cb4a0e875d7b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/flags/default/6e795df426d20983ab15f8e4cb5ea3084f5c895e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/flags/default/85061718940d36f09198007f0db91fc5b1049cbf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/default/2d1cb99c897d408e87534c437912433c36fb72e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/flags/default/4f0f94aa9dd65474a03b347d76bb535568cc9b38 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/default/5e7889f144bc77f7dbb7c457e949e6c12fdc1460 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/flags/default/9ba50649a84a1c7362eb63d0284c4298ca252d90 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/flags/default/dcaea7d27e01c52cb1866e134a3cff8bf363a081 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  .generated_files/flags/default/9977379360fc3628ec232cab0ff9847a107fd65a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/flags/default/707e58bff58dd4fe6b84f6ab3b6cd0c634600afb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/rtos_hooks.o: ../src/system_config/default/rtos_hooks.c  .generated_files/flags/default/60231fe1fd9efe9e46d0c3c7b0b9ecce7186be86 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/rtos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/rtos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/rtos_hooks.o.d" -o ${OBJECTDIR}/_ext/1688732426/rtos_hooks.o ../src/system_config/default/rtos_hooks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/apptemp.o: ../src/apptemp.c  .generated_files/flags/default/c28c83d7f2a29c451801d1b5867c34b8e83172b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/apptemp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/apptemp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/apptemp.o.d" -o ${OBJECTDIR}/_ext/1360937237/apptemp.o ../src/apptemp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/applcd.o: ../src/applcd.c  .generated_files/flags/default/f592098239972b650b65a17e5ecf26b62b1dd8ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/applcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/applcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/applcd.o.d" -o ${OBJECTDIR}/_ext/1360937237/applcd.o ../src/applcd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/5d671d95b7fde10dd4ba924d93a6e0df0fbfb890 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o: ../src/Mc32SpiUtil.c  .generated_files/flags/default/1110b3ed407972a1901c6f30c59c888529d0757 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32SpiUtil.o ../src/Mc32SpiUtil.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o: ../src/Mc32gestSPiLM70.c  .generated_files/flags/default/1e1de061e6a4f7de055085692cd1d4730906f1d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32gestSPiLM70.o ../src/Mc32gestSPiLM70.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/bsp.o: ../../../../../bsp/pic32mx_skes/bsp.c  .generated_files/flags/default/b954622a0e2694b2bcf8f5151c2c2d93d4463403 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/bsp.o.d" -o ${OBJECTDIR}/_ext/2048899216/bsp.o ../../../../../bsp/pic32mx_skes/bsp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32Delays.o: ../../../../../bsp/pic32mx_skes/Mc32Delays.c  .generated_files/flags/default/70b169b5d643e64afdfb7758cab1164069b80131 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32Delays.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32Delays.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32Delays.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32Delays.o ../../../../../bsp/pic32mx_skes/Mc32Delays.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o: ../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c  .generated_files/flags/default/3d16443a36821e9442942d931b7a084cbd21002e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdc.o ../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o: ../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c  .generated_files/flags/default/26eeec1a7f9c38fe1368600018b54d6d19eea0b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32DriverAdcAlt.o ../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o: ../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c  .generated_files/flags/default/9f8b5ad50c9b6fb09f03cd85be974671e5da54e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32DriverLcd.o ../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o: ../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c  .generated_files/flags/default/94f73b2b4e0a0c76604657b9925aa34f1a07332b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2048899216" 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o.d" -o ${OBJECTDIR}/_ext/2048899216/Mc32CoreTimer.o ../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/308321468/osal_freertos.o: ../../../../../framework/osal/src/osal_freertos.c  .generated_files/flags/default/62e30d08c0affc7b5a82f7959d656c3cbf55b8c7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/308321468" 
	@${RM} ${OBJECTDIR}/_ext/308321468/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/308321468/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/308321468/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/308321468/osal_freertos.o ../../../../../framework/osal/src/osal_freertos.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/default/533cfd522bdf994c7b19af81d69437f4822307d9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1107379230/heap_1.o: ../../../../../third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/default/418a223b36c96877dfb3d7e8d68539d64952a0ed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1107379230" 
	@${RM} ${OBJECTDIR}/_ext/1107379230/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1107379230/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1107379230/heap_1.o.d" -o ${OBJECTDIR}/_ext/1107379230/heap_1.o ../../../../../third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1282498059/port.o: ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/acaa3f134e6e38e6d223fca2d25c97e27d4ff2fb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1282498059" 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1282498059/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1282498059/port.o.d" -o ${OBJECTDIR}/_ext/1282498059/port.o ../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/croutine.o: ../../../../../third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/default/d09f1aabadc13d4cb0ea6046a25c77f7e930abb3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/croutine.o.d" -o ${OBJECTDIR}/_ext/373060831/croutine.o ../../../../../third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/list.o: ../../../../../third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/default/e49c0cb569421b0a7733e799358b2cfb3300e29 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/list.o.d" -o ${OBJECTDIR}/_ext/373060831/list.o ../../../../../third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/queue.o: ../../../../../third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/default/12d4afc309512bf57362df877dc720a46d168ccb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/queue.o.d" -o ${OBJECTDIR}/_ext/373060831/queue.o ../../../../../third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/tasks.o: ../../../../../third_party/rtos/FreeRTOS/Source/tasks.c  .generated_files/flags/default/8b1108d5ee7553ae56f3572641b53a21654117fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/tasks.o.d" -o ${OBJECTDIR}/_ext/373060831/tasks.o ../../../../../third_party/rtos/FreeRTOS/Source/tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/timers.o: ../../../../../third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/default/55001f15f9c4f675ef33fbe1e2bf76238098d34a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/timers.o.d" -o ${OBJECTDIR}/_ext/373060831/timers.o ../../../../../third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/event_groups.o: ../../../../../third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/default/ca65478813385e2758d78df21e7ce8554c97d504 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/event_groups.o.d" -o ${OBJECTDIR}/_ext/373060831/event_groups.o ../../../../../third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/373060831/stream_buffer.o: ../../../../../third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/default/5dc06499ef73790fa849b9fa401ddcae11541341 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/373060831" 
	@${RM} ${OBJECTDIR}/_ext/373060831/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/373060831/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -D__XC -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../bsp/pic32mx_skes" -I"../../../../../third_party/rtos/FreeRTOS/Source/include" -I"../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/373060831/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/373060831/stream_buffer.o ../../../../../third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/TP5_FreeRTOS_AvecOs.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a  
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD4=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/TP5_FreeRTOS_AvecOs.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512L_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD4=1,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	
else
${DISTDIR}/TP5_FreeRTOS_AvecOs.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a 
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/TP5_FreeRTOS_AvecOs.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512L_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/TP5_FreeRTOS_AvecOs.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
