PACKAGE=com.ctech.eaty ACTIVITY=ui.home.view.HomeActivity

if [ "$1" == "react" ]; then
cd app/src/main/js
react-native bundle --platform android --dev false --entry-file live.android.js --bundle-output ../assets/react/live/index.android.bundle
react-native bundle --platform android --dev false --entry-file jobs.android.js --bundle-output ../assets/react/jobs/index.android.bundle
react-native bundle --platform android --dev false --entry-file meetups.android.js --bundle-output ../assets/react/meetups/index.android.bundle
react-native bundle --platform android --dev false --entry-file ask.android.js --bundle-output ../assets/react/ask/index.android.bundle
react-native bundle --platform android --dev false --entry-file newsletter.android.js --bundle-output ../assets/react/newsletter/index.android.bundle

cd ../../../../
fi

./gradlew installDebug --parallel --offline
echo "Starting $ACTIVITY"
adb shell am start -n ${PACKAGE}/.${ACTIVITY}
