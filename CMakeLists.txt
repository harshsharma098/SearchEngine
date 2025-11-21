cmake_minimum_required(VERSION 3.16)
project(SearchEngine VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Qt6 or Qt5
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Widgets)

# Include directories
include_directories(include)

# Source files
set(CORE_SOURCES
    src/core/Tokenizer.cpp
    src/core/StopWordRemover.cpp
    src/core/DocumentIndexer.cpp
    src/core/TFIDFCalculator.cpp
    src/core/SearchEngine.cpp
)

set(GUI_SOURCES
    src/gui/main.cpp
    src/gui/MainWindow.cpp
)

# Header files
set(HEADERS
    include/core/Tokenizer.h
    include/core/StopWordRemover.h
    include/core/DocumentIndexer.h
    include/core/TFIDFCalculator.h
    include/core/SearchEngine.h
    include/gui/MainWindow.h
)

# Create executable
add_executable(${PROJECT_NAME}
    ${CORE_SOURCES}
    ${GUI_SOURCES}
    ${HEADERS}
)

# Link Qt libraries
target_link_libraries(${PROJECT_NAME}
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Widgets
)

# Link filesystem library if needed (GCC < 9, or explicitly required)
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS "9.0")
    target_link_libraries(${PROJECT_NAME} stdc++fs)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang" AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS "9.0")
    target_link_libraries(${PROJECT_NAME} c++fs)
endif()

# Enable automatic MOC for Qt
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Set output directory
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

