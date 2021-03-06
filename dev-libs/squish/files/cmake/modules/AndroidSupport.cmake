#
#  CMake custom modules
#  Copyright (C) 2011-2015  Cedric OCHS
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

MACRO(INIT_BUILD_FLAGS_ANDROID)
  IF(ANDROID)
    ADD_PLATFORM_FLAGS("--sysroot=${PLATFORM_ROOT}")
    ADD_PLATFORM_FLAGS("-ffunction-sections -funwind-tables -no-canonical-prefixes")
    ADD_PLATFORM_FLAGS("-DANDROID")
    ADD_PLATFORM_FLAGS("-I${STL_INCLUDE_DIR} -I${STL_INCLUDE_CPU_DIR}")

    IF(CLANG)
      IF(TARGET_ARM64)
        SET(LLVM_TRIPLE "aarch64-none-linux-android")
      ELSEIF(TARGET_ARMV7)
        SET(LLVM_TRIPLE "armv7-none-linux-androideabi")
      ELSEIF(TARGET_ARMV5)
        SET(LLVM_TRIPLE "armv5te-none-linux-androideabi")
      ELSEIF(TARGET_X64)
        SET(LLVM_TRIPLE "x86_64-none-linux-android")
      ELSEIF(TARGET_X86)
        SET(LLVM_TRIPLE "i686-none-linux-android")
      ELSEIF(TARGET_MIPS64)
        SET(LLVM_TRIPLE "mips64el-none-linux-android")
      ELSEIF(TARGET_MIPS)
        SET(LLVM_TRIPLE "mipsel-none-linux-android")
      ELSE()
        MESSAGE(FATAL_ERROR "Unspported architecture ${TARGET_CPU}")
      ENDIF()

      ADD_PLATFORM_FLAGS("-gcc-toolchain ${GCC_TOOLCHAIN_ROOT}")
      SET(PLATFORM_LINKFLAGS "${PLATFORM_LINKFLAGS} -gcc-toolchain ${GCC_TOOLCHAIN_ROOT}")

      ADD_PLATFORM_FLAGS("-target ${LLVM_TRIPLE}") # -emit-llvm -fPIC ?
      SET(PLATFORM_LINKFLAGS "${PLATFORM_LINKFLAGS} -target ${LLVM_TRIPLE}")
    ELSE()
      ADD_PLATFORM_FLAGS("-Wa,--noexecstack")
    ENDIF()

    IF(TARGET_ARM)
      ADD_PLATFORM_FLAGS("-fpic -fstack-protector")
      ADD_PLATFORM_FLAGS("-D__ARM_ARCH_5__ -D__ARM_ARCH_5T__ -D__ARM_ARCH_5E__ -D__ARM_ARCH_5TE__")

      IF(CLANG)
        ADD_PLATFORM_FLAGS("-fno-integrated-as")
      ENDIF()

      IF(TARGET_ARMV7)
        ADD_PLATFORM_FLAGS("-march=armv7-a -mfpu=vfpv3-d16")

        SET(ARMV7_HARD_FLOAT OFF)

        IF(ARMV7_HARD_FLOAT)
          ADD_PLATFORM_FLAGS("-mhard-float -D_NDK_MATH_NO_SOFTFP=1")
          SET(PLATFORM_LINKFLAGS "${PLATFORM_LINKFLAGS} -Wl,--no-warn-mismatch -lm_hard")
        ELSE()
          ADD_PLATFORM_FLAGS("-mfloat-abi=softfp")
        ENDIF()

        IF(NOT CLANG)
          SET(PLATFORM_LINKFLAGS "${PLATFORM_LINKFLAGS} -march=armv7-a")
        ENDIF()
        
        SET(PLATFORM_LINKFLAGS "${PLATFORM_LINKFLAGS} -Wl,--fix-cortex-a8")
      ELSEIF(TARGET_ARMV5)
        ADD_PLATFORM_FLAGS("-march=armv5te -mtune=xscale -msoft-float")
      ENDIF()

      SET(TARGET_THUMB ON)

      IF(TARGET_THUMB)
        IF(NOT CLANG)
          ADD_PLATFORM_FLAGS("-finline-limit=64")
        ENDIF()

        SET(DEBUG_CFLAGS "${DEBUG_CFLAGS} -marm")
        SET(RELEASE_CFLAGS "${RELEASE_CFLAGS} -mthumb")
      ELSE()
        IF(NOT CLANG)
          ADD_PLATFORM_FLAGS("-funswitch-loops -finline-limit=300")
        ENDIF()
      ENDIF()
    ELSEIF(TARGET_X86)
      # Same options for x86 and x86_64
      IF(CLANG)
        ADD_PLATFORM_FLAGS("-fPIC")
      ELSE()
        ADD_PLATFORM_FLAGS("-funswitch-loops -finline-limit=300")
        # Optimizations for Intel Atom
#          ADD_PLATFORM_FLAGS("-march=i686 -mtune=atom -mstackrealign -msse3 -mfpmath=sse -m32 -flto -ffast-math -funroll-loops")
      ENDIF()
      ADD_PLATFORM_FLAGS("-fstack-protector")
    ELSEIF(TARGET_MIPS)
      # Same options for mips and mips64
      IF(NOT CLANG)
        ADD_PLATFORM_FLAGS("-frename-registers -fno-inline-functions-called-once -fgcse-after-reload -frerun-cse-after-loop")
        SET(RELEASE_CFLAGS "${RELEASE_CFLAGS} -funswitch-loops -finline-limit=300")
      ENDIF()
      ADD_PLATFORM_FLAGS("-fpic -finline-functions -fmessage-length=0")
    ENDIF()
    SET(PLATFORM_LINKFLAGS "${PLATFORM_LINKFLAGS} -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -no-canonical-prefixes")
    SET(PLATFORM_LINKFLAGS "${PLATFORM_LINKFLAGS} -L${PLATFORM_ROOT}/usr/lib")
  ENDIF()
ENDMACRO()
