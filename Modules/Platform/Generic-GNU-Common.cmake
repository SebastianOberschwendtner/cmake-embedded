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
# Description: Common settings for the gnu-arm-none-eabi toolchain.
# ----------------------------------------------------------------------------

# Produce .elf output files
set(CMAKE_EXECUTABLE_SUFFIX ".elf")

# Set common compile flags
set(CMAKE_ASM_FLAGS_INIT "-mthumb ${CMAKE_FPU_FLAGS} -x assembler-with-cpp ")
set(CMAKE_C_FLAGS_INIT "-mthumb ${CMAKE_FPU_FLAGS} ")
set(CMAKE_CXX_FLAGS_INIT "-mthumb ${CMAKE_FPU_FLAGS} -fno-exceptions -fno-rtti ")

# Set common linker flags
set(CMAKE_EXE_LINKER_FLAGS_INIT "-mthumb ${CMAKE_FPU_FLAGS} ")

# Add linker script if given
if( EXISTS ${LINKER_SCRIPT} )
    set(CMAKE_EXE_LINKER_FLAGS_INIT "${CMAKE_EXE_LINKER_FLAGS_INIT} -T${LINKER_SCRIPT} ")
endif()

