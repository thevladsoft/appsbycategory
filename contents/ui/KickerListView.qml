import QtQuick 2.3
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.draganddrop 2.0 as DragAndDrop

ListView {
	id: listView
	width: parent.width
	Layout.fillHeight: true
	clip: true
	cacheBuffer: 200 // Don't unload when scrolling (prevent stutter)

	// snapMode: ListView.SnapToItem
	keyNavigationWraps: true
	highlightMoveDuration: 0
	highlightResizeDuration: 0

	property bool showItemUrl: true
	property bool showDesktopFileUrl: false
	property int iconSize: 36 * units.devicePixelRatio
    section.labelPositioning:ViewSection.CurrentLabelAtStart
// section.criteria:ViewSection.FirstCharacter
//     displayMarginBeginning : 100
//     displayMarginEnd : 100
    
	section.delegate: Item {
		id: sectionDelegate

// 		height: parent.width
		width: childrenRect.height*0.8
		anchors {
// 				left: parent.left
//                 right: parent.right
//                 left: listView.left
            left: parent.left
//             leftMargin: units.smallSpacing
//             rightMargin: units.smallSpacing
        }

		PlasmaComponents.Label {
			id: sectionHeading
			anchors {
// 				left: parent.left
//                 right: parent.right
//                 left: listView.left
				leftMargin: units.smallSpacing
				rightMargin: units.smallSpacing
				topMargin: units.smallSpacing
				bottomMargin: units.smallSpacing
			}
			text: section
// 			font.bold: true
			font.italic: true
			font.pointSize: 12
			font.capitalization : Font.AllUppercase
			font.letterSpacing : 1.0
            font.underline : true
            font.weight : Font.Bold
            style :Text.Outline
            rotation: -90


// 			property bool centerOverIcon: sectionHeading.contentWidth <= listView.iconSize
// 			width: centerOverIcon ? listView.iconSize : parent.width
            width:  parent.width
			horizontalAlignment: Text.AlignRight//centerOverIcon ? Text.AlignHCenter : Text.AlignLeft
		}
	}

	delegate: MenuListItem {}

	property var modelList: model ? model.list : []
	
	// currentIndex: 0
	// Connections {
	// 	target: appsModel.allAppsModel
	// 	onRefreshing: {
	// 		console.log('appsList.onRefreshing')
	// 		appsList.model = []
	// 		// console.log('search.results.onRefreshed')
	// 		appsList.currentIndex = 0
	// 	}
	// 	onRefreshed: {
	// 		console.log('appsList.onRefreshed')
	// 		// appsList.model = appsModel.allAppsList
	// 		appsList.model = appsModel.allAppsList
	// 		appsList.modelList = appsModel.allAppsList.list
	// 		appsList.currentIndex = 0
	// 	}
	// }

// 	highlight: PlasmaComponents.Highlight {
// 		visible: listView.currentItem && !listView.currentItem.isSeparator
// 	}

	// function triggerIndex(index) {
	// 	model.triggerIndex(index)
	// }

	function goUp() {
		if (verticalLayoutDirection == ListView.TopToBottom) {
			decrementCurrentIndex()
		} else { // ListView.BottomToTop
			incrementCurrentIndex()
		}
	}

	function goDown() {
		if (verticalLayoutDirection == ListView.TopToBottom) {
			incrementCurrentIndex()
		} else { // ListView.BottomToTop
			decrementCurrentIndex()
		}
	}

	function skipToMin() {
		currentIndex = Math.max(0, currentIndex - 10)
	}

	function skipToMax() {
		currentIndex = Math.min(currentIndex + 10, count-1)
	}

	function pageUp() {
		if (verticalLayoutDirection == ListView.TopToBottom) {
			skipToMin()
		} else { // ListView.BottomToTop
			skipToMax()
		}
	}

	function pageDown() {
		if (verticalLayoutDirection == ListView.TopToBottom) {
			skipToMax()
		} else { // ListView.BottomToTop
			skipToMin()
		}
	}
}
