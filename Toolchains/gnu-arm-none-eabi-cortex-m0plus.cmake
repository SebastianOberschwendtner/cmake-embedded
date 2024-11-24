# ----------------------------------------------------------------------------
# Embedded CMake Toolchain
# Copyright (c) 2024 Sebastian Oberschwendtner, sebastian.oberschwendtner@gmail.com
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# ============================================================================
#
# Author: Sebastian Oberschwendtner
# Date: 23.11.2024
# Version: 1.0.0
# Description: CMake toolchain file using gnu-arm-none-eabi for ARM Cortex-M0+
# ----------------------------------------------------------------------------

# Make the custom platform files available in the module path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../Modules")

# Add embedded tools
include(EmbeddedTools)

# Set the platform
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m0plus)
set(CMAKE_FPU_FLAGS "-mfloat-abi=soft" CACHE INTERNAL "FPU flags for compiler")

# Specify tools
set(PREFIX arm-none-eabi)
set(CMAKE_ASM_COMPILER ${PREFIX}-gcc)
set(CMAKE_C_COMPILER ${PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${PREFIX}-g++)
set(CMAKE_LINKER ${PREFIX}-ld)
set(CMAKE_OBJCOPY ${PREFIX}-objcopy)
set(CMAKE_OBJDUMP ${PREFIX}-objdump)
set(CMAKE_SIZE ${PREFIX}-size)

# CMake options
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

