load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "action_config",
    "artifact_name_pattern",
    "env_entry",
    "env_set",
    "feature",
    "feature_set",
    "flag_group",
    "flag_set",
    "tool",
    "tool_path",
    "variable_with_value",
    "with_feature_set",
)
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
all_compile_actions = [
    ACTION_NAMES.c_compile,
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.assemble,
    ACTION_NAMES.preprocess_assemble,
    ACTION_NAMES.cpp_header_parsing,
    ACTION_NAMES.cpp_module_compile,
    ACTION_NAMES.cpp_module_codegen,
    ACTION_NAMES.clif_match,
    ACTION_NAMES.lto_backend,
]

all_cpp_compile_actions = [
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.cpp_header_parsing,
    ACTION_NAMES.cpp_module_compile,
    ACTION_NAMES.cpp_module_codegen,
    ACTION_NAMES.clif_match,
]

preprocessor_compile_actions = [
    ACTION_NAMES.c_compile,
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.preprocess_assemble,
    ACTION_NAMES.cpp_header_parsing,
    ACTION_NAMES.cpp_module_compile,
    ACTION_NAMES.clif_match,
]

codegen_compile_actions = [
    ACTION_NAMES.c_compile,
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.assemble,
    ACTION_NAMES.preprocess_assemble,
    ACTION_NAMES.cpp_module_codegen,
    ACTION_NAMES.lto_backend,
]

all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

def _outfile(ctx):
    # return ctx['BINDIR']
    return "test-puuu"

def _impl(ctx):

    #artifact_name_patterns = [
    #     artifact_name_pattern(
    #         category_name = "object_file",
    #         prefix = "",
    #         extension = ".obj",
    #     ),
    #     artifact_name_pattern(
    #         category_name = "static_library",
    #         prefix = "",
    #         extension = ".lib",
    #     ),
    #    # artifact_name_pattern(
    #    #     category_name = "executable",
    #    #     prefix = "",
    #    #     extension = ".hex",
    #    # ),
    # ]

    cpp_link_executable_action = action_config(
        action_name = ACTION_NAMES.cpp_link_executable,
        enabled = True,
        implies = [
                "output_execpath_flags",
                "user_link_flags",
                "default_link_flags",
        ],
        tools = [tool(path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/rlink")],
    )

    cpp_link_dynamic_library_action = action_config(
        action_name = ACTION_NAMES.cpp_link_dynamic_library,
        enabled = True,
        implies = [
                "output_execpath_flags",
                "user_link_flags",
                "default_link_flags",
        ],
        tools = [tool(path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/ccrh")],
    )

    cpp_link_nodeps_dynamic_library_action = action_config(
        action_name = ACTION_NAMES.cpp_link_nodeps_dynamic_library,
        enabled = True,
        implies = [
                "output_execpath_flags",
                "user_link_flags",
                "default_link_flags",
        ],
        tools = [tool(path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/ccrh")],
    )

    cpp_link_static_library_action = action_config(
        action_name = ACTION_NAMES.cpp_link_static_library,
        enabled = True,
        implies = [
                "output_execpath_flags",
                "libraries_to_link",
        ],
        tools = [tool(path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/ccrh")],
    )

    c_compile_action = action_config(
        action_name = ACTION_NAMES.c_compile,
        enabled = True,
        implies = [
            "compiler_input_flags",
            "default_compile_flags",
            "user_compile_flags",
            #"sysroot",
            "unfiltered_compile_flags",
            "compiler_output_flags",
        ],
        tools = [tool(path = "compiler.bat")],
    )

    assemble_action = action_config(
        action_name = ACTION_NAMES.assemble,
        enabled = True,
        implies = [
            "compiler_input_flags",
            "default_compile_flags",
            "user_compile_flags",
            #"sysroot",
            "unfiltered_compile_flags",
            "compiler_output_flags",
        ],
        tools = [tool(path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/ccrh")],
    )

    tool_paths = [
        tool_path(
            name = "gcc",
            path = "compiler.bat",
        ),
        tool_path(
            name = "ld",
            path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/asrh",
        ),
        tool_path(
            name = "ar",
            path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/asrh",
        ),
        tool_path(
            name = "cpp",
            path = "compiler.bat",
        ),
        tool_path(
            name = "gcov",
            path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/rlink",
        ),
        tool_path(
            name = "nm",
            path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/rlink",
        ),
        tool_path(
            name = "objdump",
            path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/rlink",
        ),
        tool_path(
            name = "strip",
            path = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/bin/rlink",
        ),
    ]

    compiler_input_flags_feature = feature(
        name = "compiler_input_flags",
        # enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.cpp_module_codegen,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["-c", "%{source_file}"],
                        expand_if_available = "source_file",
                    ),
                ],
            ),
        ],
    )

    compiler_output_flags_feature = feature(
        name = "compiler_output_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.cpp_module_codegen,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["-o%{output_file}"],
                        expand_if_available = "output_file",
                    ),
                ],
            ),
        ],
    )

    default_compile_flags_feature = feature(
        name = "default_compile_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.cpp_module_codegen,
                    ACTION_NAMES.lto_backend,
                    ACTION_NAMES.clif_match,
                ],

            ),
        ],
    )



    user_compile_flags_feature = feature(
        name = "user_compile_flags",
        # enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.cpp_module_codegen,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["%{user_compile_flags}"],
                        iterate_over = "user_compile_flags",
                        expand_if_available = "user_compile_flags",
                    ),
                ],
            ),
        ],
    )

    unfiltered_compile_flags_feature = feature(
        name = "unfiltered_compile_flags",
        # enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.cpp_module_codegen,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["%{unfiltered_compile_flags}"],
                        iterate_over = "unfiltered_compile_flags",
                        expand_if_available = "unfiltered_compile_flags",
                    ),
                ],
            ),
        ],
    )

    output_execpath_flags_feature = feature(
        name = "output_execpath_flags",
        enabled =True,
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["-output=%{output_execpath}"],
                        expand_if_available = "output_execpath",
                    ),
                ],
            ),
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(
                        flags = ["-r", "%{output_execpath}"],
                        expand_if_available = "output_execpath",
                    ),
                ],
            ),
        ],
    )

    linker_param_file_feature = feature(
        name = "linker_param_file",
        flag_sets = [
            flag_set(
                actions = all_link_actions +
                          [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(
                        flags = ["%{linker_param_file}"],
                        expand_if_available = "linker_param_file",
                    ),
                ],
            ),
        ],
    )

    linkstamps_feature = feature(
        name = "linkstamps",
        flag_sets = [
            flag_set(
                actions = all_link_actions + [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(
                        flags = ["%{linkstamp_paths}"],
                        iterate_over = "linkstamp_paths",
                        expand_if_available = "linkstamp_paths",
                    ),
                ],
            ),
        ],
    )

    libraries_to_link_feature = feature(
        name = "libraries_to_link",
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        iterate_over = "libraries_to_link",
                        flag_groups = [
                            flag_group(
                                flags = ["-Wl,--start-lib"],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "object_file_group",
                                ),
                            ),
                            flag_group(
                                flags = ["-Wl,-whole-archive"],
                                expand_if_true =
                                    "libraries_to_link.is_whole_archive",
                            ),
                            flag_group(
                                flags = ["%{libraries_to_link.object_files}"],
                                iterate_over = "libraries_to_link.object_files",
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "object_file_group",
                                ),
                            ),
                            flag_group(
                                flags = ["%{libraries_to_link.name}"],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "object_file",
                                ),
                            ),
                            flag_group(
                                flags = ["%{libraries_to_link.name}"],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "interface_library",
                                ),
                            ),
                            flag_group(
                                flags = ["%{libraries_to_link.name}"],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "static_library",
                                ),
                            ),
                            flag_group(
                                flags = ["-l%{libraries_to_link.name}"],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "dynamic_library",
                                ),
                            ),
                            flag_group(
                                flags = ["-l:%{libraries_to_link.name}"],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "versioned_dynamic_library",
                                ),
                            ),
                            flag_group(
                                flags = ["-Wl,-no-whole-archive"],
                                expand_if_true = "libraries_to_link.is_whole_archive",
                            ),
                            flag_group(
                                flags = ["-,--end-lib"],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "object_file_group",
                                ),
                            ),
                        ],
                        expand_if_available = "libraries_to_link",
                    ),
                    flag_group(
                        flags = ["-Wl,@%{thinlto_param_file}"],
                        expand_if_true = "thinlto_param_file",
                    ),
                ],
            ),
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(
                        iterate_over = "libraries_to_link",
                        flag_groups = [
                            flag_group(
                                flags = ["%{libraries_to_link.name}"],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "object_file",
                                ),
                            ),
                        ],
                    ),
                ],
            ),

        ],
    )

    user_link_flags_feature = feature(
        name = "user_link_flags",
        # enabled = True,
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["%{user_link_flags}"],
                        iterate_over = "user_link_flags",
                        expand_if_available = "user_link_flags",
                    ),
                ],
            ),
        ],
    )

#    sysroot_feature = feature(
#        name = "sysroot",
#        enabled = True,
#        flag_sets = [
#            flag_set(
#                actions = [
#                    ACTION_NAMES.preprocess_assemble,
#                    ACTION_NAMES.linkstamp_compile,
#                    ACTION_NAMES.c_compile,
#                    ACTION_NAMES.cpp_compile,
#                    ACTION_NAMES.cpp_header_parsing,
#                    ACTION_NAMES.cpp_module_compile,
#                    ACTION_NAMES.cpp_module_codegen,
#                    ACTION_NAMES.lto_backend,
#                    ACTION_NAMES.clif_match,
#                ] + all_link_actions,
#                flag_groups = [
#                    flag_group(
#                        flags = ["--sysroot=%{sysroot}"],
#                        expand_if_available = "sysroot",
#                    ),
#                ],
#            ),
#        ],
#    )

    default_link_flags_feature = feature(
        name = "default_link_flags",
        enabled = False,
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [

                ],
            ),
        ],
    )

    strip_debug_symbols_feature = feature(
        name = "strip_debug_symbols",
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["-Wl, -S"],
                        expand_if_not_available = "strip_debug_symbols",
                    ),
                ],
            ),
        ],
    )
    random_seed_feature=feature(
    name='random_seed',
    enabled=False,
    )

    dependency_file_feature = feature(
        name = "dependency_file",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.linkstamp_compile,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["-MD", "-MF", "%{dependency_file}"],
                        #expand_if_not_available = "dependency_file",
                    ),
                ],
            ),
        ],
    )

    include_paths_feature = feature(
        name = "include_paths",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                ],
                flag_groups = [
                     flag_group(
                     flags = ["-I%{quote_include_paths}"],
                     iterate_over = "quote_include_paths",
                     ),
                    flag_group(
                        flags = ["-I%{include_paths}"],
                        iterate_over = "include_paths",
                    ),
                    flag_group(
                        flags = ["-I%{system_include_paths}"],
                        iterate_over = "system_include_paths",
                    ),
                ],
            ),
        ],
    )
    action_configs = [
        c_compile_action,
        cpp_link_executable_action,
        cpp_link_dynamic_library_action,
        cpp_link_nodeps_dynamic_library_action,
        cpp_link_static_library_action,
        assemble_action,


    ]

    features = [
        output_execpath_flags_feature,
        compiler_input_flags_feature,
        compiler_output_flags_feature,
        default_compile_flags_feature,
        user_compile_flags_feature,
        unfiltered_compile_flags_feature,
        user_link_flags_feature,
        default_link_flags_feature,
        linker_param_file_feature,
        linkstamps_feature,
        libraries_to_link_feature,
        strip_debug_symbols_feature,
        include_paths_feature,
        dependency_file_feature,
        random_seed_feature,
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        # artifact_name_patterns = artifact_name_patterns,
        action_configs = action_configs,
        cxx_builtin_include_directories = [
            "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/inc",
            ],
        #builtin_sysroot = "C:/Program Files (x86)/Renesas Electronics/CS+/CC/CC-RH/V2.03.00/lib/v850e3v5",
        toolchain_identifier = "s32k1xx-toolchain_ccrh",
        host_system_name = "ccr",
        target_system_name = "ccr",
        target_cpu = "s32k1xx_ccrh",
        target_libc = "unknown",
        compiler = "ccrh",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_toolchain_config_ccrh = rule(
    implementation = _impl,
    attrs = {},
    # provides = [CcToolchainConfigInfo],
)
