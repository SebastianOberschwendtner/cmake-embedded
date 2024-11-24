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
# Description: Convenience functions for CMake to handle embedded projects.
# ----------------------------------------------------------------------------
# Include guard
if (EmbeddedTools_Found)
    return()
endif()
set(EmbeddedTools_Found TRUE)

# ============================================================================
# Custom targets which add special options when linking with them
# ============================================================================
# nosys
add_library(nosys INTERFACE)
add_library(embedded::nosys ALIAS nosys)
target_link_options(nosys INTERFACE "--specs=nosys.specs")

# nano (newlib)
add_library(nano INTERFACE)
add_library(embedded::nano ALIAS nano)
target_link_options(nano INTERFACE "--specs=nano.specs")

# ============================================================================
# Perform the basic post processing of embedded firmware files.
#
# Details:
# This prints the binary size and converts the .elf file to a .bin file.
# 
# Args:
#   - FIRMWARE_TARGET: The firmware target to post process 
# ============================================================================
function(PostProcessFirmware FIRMWARE_TARGET)
    # Print the binary size after building
    add_custom_command(TARGET ${FIRMWARE_TARGET}
        POST_BUILD
        COMMAND echo "Binary size of ${FIRMWARE_TARGET}.elf:"
        COMMAND ${CMAKE_SIZE} ${FIRMWARE_TARGET}.elf
    )

    # Convert the elf file to binary
    add_custom_command(TARGET ${FIRMWARE_TARGET}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O binary ${FIRMWARE_TARGET}.elf ${FIRMWARE_TARGET}.bin
    )
endfunction()
