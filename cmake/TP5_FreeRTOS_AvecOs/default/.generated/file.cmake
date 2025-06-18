# The following variables contains the files used by the different stages of the build process.
set(TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_assemble)
set_source_files_properties(${TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)
set(TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_assembleWithPreprocess
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/system_interrupt_a.S")
set_source_files_properties(${TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_assembleWithPreprocess} PROPERTIES LANGUAGE ASM)
set(TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../bsp/pic32mx_skes/Mc32Delays.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../bsp/pic32mx_skes/bsp.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../framework/osal/src/osal_freertos.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../framework/system/int/src/sys_int_pic32.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/croutine.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/event_groups.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/list.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/queue.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/stream_buffer.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/tasks.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/timers.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/Mc32SpiUtil.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/Mc32gestSPiLM70.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/applcd.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/apptemp.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework/driver/usart/src/drv_usart_static.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework/system/devcon/src/sys_devcon.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework/system/ports/src/sys_ports_static.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/rtos_hooks.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/system_exceptions.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/system_init.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/system_interrupt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/system_tasks.c")
set_source_files_properties(${TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_compile_cpp)
set_source_files_properties(${TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_compile_cpp} PROPERTIES LANGUAGE CXX)
set(TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_link "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a")
set(TP5_FreeRTOS_AvecOs_default_image_name "default.elf")


# The output directory of the final image.
set(TP5_FreeRTOS_AvecOs_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/TP5_FreeRTOS_AvecOs")
