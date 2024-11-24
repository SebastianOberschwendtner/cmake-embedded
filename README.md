# Welcome to CMake Embedded Tools
This is a minimum toolchain setup to cross compile with the *gnu-arm-none-eabi* toolchain.

# Getting Started
1. Copy the files from 📁`./Template` into your project.
2. Adjust the settings in 📋`CMakePresets.json`: 
    - `toolchainFile`: Path to the toolchain file in this repository.
    - `LINKER_SCRIPT`: Provide a valid linker script suitable for your target.
3. *(optional)* The template includes a project setup for **VSCode**. Adjust these settings in 📋`.vscode/settings.json`:
    - `svdPath`: Provide the *SVD* file of your target device for debugging.
    - `openocd.interface`: The interface **OpenOCD** will use to program the target flash.
    - `openocd.target`: The target device **OpenOCD** will assume to program and debug.
4. Setup your project as usual with a 📋`CMakeLists.txt`.
5. Configure your project with:

```sh 
cmake --preset Debug
```

6. Add finally build:

```sh 
cmake --build build
```
