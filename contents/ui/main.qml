import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0 as Controls
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0
import QtMultimedia 5.4

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.private.kicker 0.1 as Kicker

Item{
  id: root;
  // Plasmoid.switchWidth: units.gridUnit * 8
  // Plasmoid.switchHeight: units.gridUnit * 8

  Plasmoid.preferredRepresentation: plasmoid.compactRepresentation
  Plasmoid.compactRepresentation: MouseArea{
        id: compactRoot

        // Taken from DigitalClock to ensure uniform sizing when next to each other
        readonly property bool tooSmall: plasmoid.formFactor === PlasmaCore.Types.Horizontal && Math.round(2 * (compactRoot.height / 5)) <= PlasmaCore.Theme.smallestFont.pixelSize

        readonly property bool shouldHaveIcon: Plasmoid.formFactor === PlasmaCore.Types.Vertical || Plasmoid.icon !== ""
        readonly property bool shouldHaveLabel: Plasmoid.formFactor !== PlasmaCore.Types.Vertical && Plasmoid.configuration.menuLabel !== ""

        readonly property var sizing: {
            const displayedIcon = buttonIcon.valid ? buttonIcon : buttonIconFallback;

            let impWidth = 0;
            if (shouldHaveIcon) {
                impWidth += displayedIcon.width;
            }
            if (shouldHaveLabel) {
                impWidth += labelTextField.contentWidth + labelTextField.Layout.leftMargin + labelTextField.Layout.rightMargin;
            }
            const impHeight = Math.max(PlasmaCore.Units.iconSizeHints.panel, displayedIcon.height);

            // at least square, but can be wider/taller
            
        }

        implicitWidth: PlasmaCore.Units.iconSizeHints.panel
        implicitHeight: PlasmaCore.Units.iconSizeHints.panel

        Layout.minimumWidth: sizing.minimumWidth
        Layout.maximumWidth: sizing.maximumWidth
        Layout.minimumHeight: sizing.minimumHeight
        Layout.maximumHeight: sizing.maximumHeight

        hoverEnabled: true

        property bool wasExpanded

        onPressed: wasExpanded = Plasmoid.expanded
        onClicked: Plasmoid.expanded = !wasExpanded

       
    }
    Component {
        id: menuRepresentation
        MenuRepresentation {}
    }
    Plasmoid.fullRepresentation: menuRepresentation  // Plasmoid.prefferedRepresentation: compactRepresentation
}

