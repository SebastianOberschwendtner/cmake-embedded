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
# Description: Cortex M0+ settings for the assembler.
# ----------------------------------------------------------------------------

# Include the common settings
include(${CMAKE_CURRENT_LIST_DIR}/Generic-GNU-Common.cmake)

# Add the processor specific compile flags
set(CMAKE_ASM_FLAGS_INIT "-mcpu=cortex-m0plus ${CMAKE_ASM_FLAGS_INIT}")


