package(default_visibility = ["//visibility:public"])
load(":cc_toolchain_config_49.bzl", "cc_toolchain_config_49")
load(":cc_toolchain_config_63.bzl", "cc_toolchain_config_63")

cc_toolchain_suite(
    name = "s32_suite_49",
    toolchains = {
        "s32k1xx_49": ":s32k1xx_toolchain_49",
        "x64_windows": ":s32k1xx_toolchain_49",
    },
)

cc_toolchain_suite(
    name = "s32_suite_63",
    toolchains = {
        "s32k1xx_63": ":s32k1xx_toolchain_63",
        "x64_windows": ":s32k1xx_toolchain_63",
    },
)

filegroup(name = "empty")

cc_toolchain(
    name = "s32k1xx_toolchain_49",
    toolchain_identifier = "s32k1xx-toolchain_49",
    toolchain_config = ":s32k1xx_toolchain_config_49",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)

cc_toolchain(
    name = "s32k1xx_toolchain_63",
    toolchain_identifier = "s32k1xx-toolchain_63",
    toolchain_config = ":s32k1xx_toolchain_config_63",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)

cc_toolchain_config_49(
    name = "s32k1xx_toolchain_config_49",
)

cc_toolchain_config_63(
    name = "s32k1xx_toolchain_config_63",
)
