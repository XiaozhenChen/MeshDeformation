workspace "Deformation"
	architecture "x64"
	
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
--IncludeDir["GLFW"] = "Hazel/vendor/GLFW/include"


--group "Dependencies"
--	include "Hazel/vendor/GLFW"
--	include "Hazel/vendor/Glad"
--	include "Hazel/vendor/imgui"
--group ""



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
		--"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",

	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"%{prj.name}/src",
		
	
	}



	links
	{
		--"GLFW",
	
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


