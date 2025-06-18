# cmake files support debug production
include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(TP5_FreeRTOS_AvecOs_default_library_list )

# Handle files with suffix s, for group default-XC32
if(TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_assemble)
add_library(TP5_FreeRTOS_AvecOs_default_default_XC32_assemble OBJECT ${TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_assemble})
    TP5_FreeRTOS_AvecOs_default_default_XC32_assemble_rule(TP5_FreeRTOS_AvecOs_default_default_XC32_assemble)
    list(APPEND TP5_FreeRTOS_AvecOs_default_library_list "$<TARGET_OBJECTS:TP5_FreeRTOS_AvecOs_default_default_XC32_assemble>")
endif()

# Handle files with suffix S, for group default-XC32
if(TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_assembleWithPreprocess)
add_library(TP5_FreeRTOS_AvecOs_default_default_XC32_assembleWithPreprocess OBJECT ${TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_assembleWithPreprocess})
    TP5_FreeRTOS_AvecOs_default_default_XC32_assembleWithPreprocess_rule(TP5_FreeRTOS_AvecOs_default_default_XC32_assembleWithPreprocess)
    list(APPEND TP5_FreeRTOS_AvecOs_default_library_list "$<TARGET_OBJECTS:TP5_FreeRTOS_AvecOs_default_default_XC32_assembleWithPreprocess>")
endif()

# Handle files with suffix [cC], for group default-XC32
if(TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_compile)
add_library(TP5_FreeRTOS_AvecOs_default_default_XC32_compile OBJECT ${TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_compile})
    TP5_FreeRTOS_AvecOs_default_default_XC32_compile_rule(TP5_FreeRTOS_AvecOs_default_default_XC32_compile)
    list(APPEND TP5_FreeRTOS_AvecOs_default_library_list "$<TARGET_OBJECTS:TP5_FreeRTOS_AvecOs_default_default_XC32_compile>")
endif()

# Handle files with suffix cpp, for group default-XC32
if(TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_compile_cpp)
add_library(TP5_FreeRTOS_AvecOs_default_default_XC32_compile_cpp OBJECT ${TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_compile_cpp})
    TP5_FreeRTOS_AvecOs_default_default_XC32_compile_cpp_rule(TP5_FreeRTOS_AvecOs_default_default_XC32_compile_cpp)
    list(APPEND TP5_FreeRTOS_AvecOs_default_library_list "$<TARGET_OBJECTS:TP5_FreeRTOS_AvecOs_default_default_XC32_compile_cpp>")
endif()


add_executable(${TP5_FreeRTOS_AvecOs_default_image_name} ${TP5_FreeRTOS_AvecOs_default_library_list})
set_target_properties(${TP5_FreeRTOS_AvecOs_default_image_name} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${TP5_FreeRTOS_AvecOs_default_output_dir})

target_link_libraries(${TP5_FreeRTOS_AvecOs_default_image_name} PRIVATE ${TP5_FreeRTOS_AvecOs_default_default_XC32_FILE_TYPE_link})

# Add the link options from the rule file.
TP5_FreeRTOS_AvecOs_default_link_rule(${TP5_FreeRTOS_AvecOs_default_image_name})

# Add bin2hex target for converting built file to a .hex file.
string(REGEX REPLACE [.]elf$ .hex TP5_FreeRTOS_AvecOs_default_image_name_hex ${TP5_FreeRTOS_AvecOs_default_image_name})
add_custom_target(TP5_FreeRTOS_AvecOs_default_Bin2Hex ALL
    COMMAND ${MP_BIN2HEX} ${TP5_FreeRTOS_AvecOs_default_output_dir}/${TP5_FreeRTOS_AvecOs_default_image_name}
    BYPRODUCTS ${TP5_FreeRTOS_AvecOs_default_output_dir}/${TP5_FreeRTOS_AvecOs_default_image_name_hex}
    COMMENT Convert built file to .hex)
add_dependencies(TP5_FreeRTOS_AvecOs_default_Bin2Hex ${TP5_FreeRTOS_AvecOs_default_image_name})



