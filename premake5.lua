workspace "WiringPi"
    configurations { "Debug", "Release" }
    architecture "arm64"  -- Change to "arm64" if you are targeting ARM

project "WiringPi"
    kind "StaticLib"  -- We want to build a static library
    language "C"
    targetdir "bin/%{cfg.buildcfg}"  -- Output folder for build
    objdir "obj/%{cfg.buildcfg}"

    -- Set the include and source directories
    includedirs {
        "wiringPi"
    }

    files {
        "wiringPi/*.c",  -- Adjust if the sources are in a different folder
    }

    filter "system:linux"
        buildoptions { "-Wall", "-Wextra" }

    filter "configurations:Debug"
        symbols "On"
        optimize "Off"

    filter "configurations:Release"
        optimize "On"
        symbols "Off"
