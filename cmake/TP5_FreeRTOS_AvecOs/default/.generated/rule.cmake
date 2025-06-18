# The following functions contains all the flags passed to the different build stages.

set(PACK_REPO_PATH "C:/Users/thebi/.mchp_packs" CACHE PATH "Path to the root of a pack repository.")

function(TP5_FreeRTOS_AvecOs_default_default_XC32_assemble_rule target)
    set(options
        "-g"
        "${ASSEMBLER_PRE}"
        "-mprocessor=32MX795F512L"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--gdwarf-2,-I${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/include"
        "${MDFP_PATH}")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target} PRIVATE "__DEBUG")
    target_include_directories(${target}
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/include"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/TP5_FreeRTOS_AvecOs.X"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/TP5_FreeRTOS_AvecOs.X")
endfunction()
function(TP5_FreeRTOS_AvecOs_default_default_XC32_assembleWithPreprocess_rule target)
    set(options
        "-x"
        "assembler-with-cpp"
        "-g"
        "${MP_EXTRA_AS_PRE}"
        "${DEBUGGER_NAME_AS_MACRO}"
        "-mprocessor=32MX795F512L"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,-I${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/include")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target}
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/include"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/TP5_FreeRTOS_AvecOs.X"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/TP5_FreeRTOS_AvecOs.X")
endfunction()
function(TP5_FreeRTOS_AvecOs_default_default_XC32_compile_rule target)
    set(options
        "-g"
        "${CC_PRE}"
        "-x"
        "c"
        "-c"
        "-mprocessor=32MX795F512L"
        "-ffunction-sections"
        "-fno-common"
        "-Wall")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG"
        PRIVATE "__XC"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target}
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default"
        PRIVATE "firmware/src/default"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../framework"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/src/system_config/default/framework"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../bsp/pic32mx_skes"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/include"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MX"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/TP5_FreeRTOS_AvecOs.X")
endfunction()
function(TP5_FreeRTOS_AvecOs_default_default_XC32_compile_cpp_rule target)
    set(options
        "-g"
        "${CC_PRE}"
        "${DEBUGGER_NAME_AS_MACRO}"
        "-mprocessor=32MX795F512L"
        "-frtti"
        "-fexceptions"
        "-fno-check-new"
        "-fenforce-eh-specs"
        "-ffunction-sections"
        "-O1"
        "-fno-common")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/TP5_FreeRTOS_AvecOs.X")
endfunction()
function(TP5_FreeRTOS_AvecOs_default_link_rule target)
    set(options
        "-g"
        "${MP_EXTRA_LD_PRE}"
        "${DEBUGGER_OPTION_TO_LINKER}"
        "${DEBUGGER_NAME_AS_MACRO}"
        "-mprocessor=32MX795F512L"
        "-Wl,--defsym=__MPLAB_BUILD=1${MP_EXTRA_LD_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L${CMAKE_CURRENT_SOURCE_DIR}/../../../firmware/TP5_FreeRTOS_AvecOs.X,--memorysummary,memoryfile.xml")
    list(REMOVE_ITEM options "")
    target_link_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target} PRIVATE "XPRJ_default=default")
endfunction()
