TARGET = plvgui
TEMPLATE = lib
CONFIG += plugin

DESTDIR= ../libs/

DEPENDPATH += . \
              ..
              
include(../ParleVision.local)
macx { 
    LIBS += -framework OpenCV
    
    # Make sure there is no mess in ./
    # but put all output files in build/(debug|release)
#    !debug_and_release|build_pass { 
#        CONFIG(debug, debug|release):BUILDDIR = build/debug
#        CONFIG(release, debug|release):BUILDDIR = build/release
#    }
#    MOC_DIR = $$BUILDDIR
#    OBJECTS_DIR = $$BUILDDIR
#    RCC_DIR = $$BUILDDIR
#    UI_DIR = $$BUILDDIR
#    DESTDIR = $$BUILDDIR
}

LIBS += -L../libs -lplvcore

CONFIG(debug, debug|release):DEFINES += DEBUG
QT      += xml

#QMAKE_CXXFLAGS_DEBUG += -pedantic \
# -Wunused-parameter \
# -Wunused-variable
INCLUDEPATH +=  ../include/plvcore \
                ../include/plvgui
                
SOURCES += \
    src/MainWindow.cpp \
    src/OpenCVImageRenderer.cpp \
    src/RendererFactory.cpp \
    src/DataRenderer.cpp \
    src/ImageConverter.cpp \
    src/LibraryWidget.cpp \
    src/InspectorWidget.cpp \
    src/PipelineScene.cpp \
    src/PipelineElementWidget.cpp \
    src/LibraryElement.cpp \
    src/ConnectionLine.cpp \
    src/PinWidget.cpp \
    src/InteractiveLine.cpp \
    src/ViewerWidget.cpp \
    src/CameraConfigFormBuilder.cpp \
    src/ElementConfigFormBuilder.cpp

HEADERS += \
    ../include/plvgui/MainWindow.h \
    ../include/plvgui/OpenCVImageRenderer.h \
    ../include/plvgui/RendererFactory.h \
    ../include/plvgui/DataRenderer.h \
    ../include/plvgui/ImageConverter.h \
    ../include/plvgui/PipelineScene.h \
    ../include/plvgui/LibraryWidget.h \
    ../include/plvgui/InspectorWidget.h \
    ../include/plvgui/PipelineElementWidget.h \
    ../include/plvgui/LibraryElement.h \
    ../include/plvgui/ConnectionLine.h \
    ../include/plvgui/PinWidget.h \
    ../include/plvgui/PinClickedEvent.h \
    ../include/plvgui/InteractiveLine.h \
    ../include/plvgui/ViewerWidget.h \
    ../include/plvgui/ElementConfigFormBuilder.h \
    ../include/plvgui/CameraConfigFormBuilder.h

FORMS += ../resources/mainwindow.ui \
    ../resources/librarywidget.ui \
    ../resources/inspectorwidget.ui \
    ../resources/viewerwidget.ui \
    ../resources/cameraconfigform.ui

RESOURCES += ../resources/icons.qrc