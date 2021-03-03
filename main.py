# This Python file uses the following encoding: utf-8
import sys
import os
import datetime

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

        # Creating a timer
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.setTime())
        self.timer.start(1000)

    # Signal Set name
    setName = Signal(str)

    # print time
    printTime = Signal(str)

    # Recieve switch status signal
    isVisible = Signal(bool)

    # Signal for read text
    readTextSignal = Signal(str)

    # Text string
    textField = ""

    # Set time slot
    def setTime(self):
        now = datetime.datetime.now()
        formattedTime = now.strftime("The time is %I:%M:%S %p in %Y-%m-%d")
        # print(formattedTime)
        self.printTime.emit(formattedTime)

    # set the slot
    @Slot(str)
    def welcomeText(self, name):
        self.setName.emit("Welcome, " + name)

    # Act on the switch status signal
    @Slot(bool)
    def showHideRectangle(self, isChecked):
        print("Rectangle visible ", isChecked)
        self.isVisible.emit(isChecked)

    # function to open file
    @Slot(str)
    def openFile(self, filePath):
        file = open(QUrl(filePath).toLocalFile(), encoding="utf-8")
        textRead = file.read()
        file.close()
        print(textRead)
        self.readTextSignal.emit(str(textRead))

    # function to receive text file that has been modified
    @Slot(str)
    def getTextFile(self, text):
        self.textField = text

    @Slot(str)
    def writeFile(self, filePath):
        file = open(QUrl(filePath).toLocalFile(), "w")
        file.write(self.textField)
        file.close()
        print(self.textField)


if __name__ == "__main__":

    # introduce necessary boilerplate
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # main window application
    main = MainWindow()
#    engine.rootContext().setContextProperty("backend", main)
    ctx = engine.rootContext()
    ctx.setContextProperty("backend", main)

    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
