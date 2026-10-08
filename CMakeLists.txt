cmake_minimum_required(VERSION 3.16)

project(ShriChaurasiPadApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_add_executable(appShriChaurasiPadApp
    main.cpp
)

qt_add_qml_module(appShriChaurasiPadApp
    URI ChaurasiPad
    VERSION 1.0
    QML_FILES main.qml
    RESOURCES assets/chaurasi_pad.json
)

target_link_libraries(appShriChaurasiPadApp PRIVATE Qt6::Quick Qt6::QuickControls2)
