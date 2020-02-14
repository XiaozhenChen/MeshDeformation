workspace "Deformation"
	architecture "x86"
	
	startproject "Local"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

--include directories relative to root folder(solution direction)
IncludeDir = {}
--IncludeDir["Eigen"] = "Local/vendor/Eigen"


group "Dependencies"
	
group ""



project "Local"
	location "Local"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	--pchheader "hzpch.h"
	--pchsource "Hazel/src/hzpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/Eigen/*",
		"%{prj.name}/vendor/glut/**.h",
		"%{prj.name}/vendor/Lib/Taucs/**.h",
		"%{prj.name}/vendor/Lib/CSparse/Include/**.h"
	

	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor",
		"%{prj.name}/vendor/Eigen",
		"%{prj.name}/vendor/gl",
		"%{prj.name}/vendor/gl/glut",
		"%{prj.name}/vendor/Lib",
		"%{prj.name}/vendor/Lib/Taucs/",
		"%{prj.name}/vendor/Lib/CSparse/Include",
		"%{prj.name}/vendor/Lib/CSparse/lib"
		
	}


	libdirs { 
		"%{prj.name}/vendor/gl/glut",
		"%{prj.name}/vendor/Lib/CSparse/lib",
		"%{prj.name}/vendor/Lib/Taucs"
	}

	links
	{
	"glut32.lib",
	"glut32.dll",
	"CSparse08.lib",
	"libtaucs.lib"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"HZ_PLATFORM_WINDOWS",
			--"HZ_BUILD_DLL",
		--	"GLFW_INCLUDE_NONE"
		}

	

	filter "configurations:Debug"
		defines "Deform_DEBUG"
		runtime "Debug"
		symbols "on"


