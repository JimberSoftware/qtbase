import qbs

Group {
    name: "global"
    prefix: path + '/'

    property string elfInterpreter

    cpp.defines: outer.concat(elfInterpreter
                     ? ['ELF_INTERPRETER="' + elfInterpreter + '"']
                     : [])
    cpp.includePaths: outer.concat([project.configPath])
    files: [
        "archdetect.cpp",
        "qcompilerdetection.h",
        "qendian.h",
        "qflags.h",
        "qfloat16.h",
        "qfloat16_p.h",
        "qglobal.cpp",
        "qglobal.h",
        "qglobalstatic.cpp",
        "qglobalstatic.h",
        "qhooks.cpp",
        "qhooks_p.h",
        "qisenum.h",
        "qlibraryinfo.cpp",
        "qlibraryinfo.h",
        "qlogging.cpp",
        "qlogging.h",
        "qmalloc.cpp",
        "qnamespace.h",
        "qnumeric.cpp",
        "qnumeric.h",
        "qnumeric_p.h",
        "qoperatingsystemversion.cpp",
        "qoperatingsystemversion.h",
        "qoperatingsystemversion_p.h",
        "qprocessordetection.h",
        "qsysinfo.h",
        "qsystemdetection.h",
        "qversiontagging.h",
        "qtypeinfo.h",
        "qtypetraits.h",
        "qt_pch.h",
    ]
    Group {
        name: "global/darwin"
        condition: qbs.targetOS.contains("darwin")
        files: "qoperatingsystemversion_darwin.mm"
    }
    Group {
        name: "global/windows"
        condition: qbs.targetOS.contains("windows")
        files: "qoperatingsystemversion_win.cpp"
    }
    Group {
        name: "global/versiontagging"
        cpp.cxxFlags: outer.concat(qbs.toolchain.contains("gcc")
                          && QtGlobalPrivateConfig.ltcg ? ["-fno-lto"] : [])
        files: "qversiontagging.cpp"
    }
}