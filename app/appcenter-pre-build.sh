if [ -z "$VERSION_NAME" ]
			then

			echo "You need define add VERSION_NAME variable in App Center build settings portal under environment variables"

			exit

			fi

			ANDROID_BUILD_GRADLE=$APPCENTER_SOURCE_DIRECTORY/Build.gradle

			if [ -e "$ANDROID_BUILD_GRADLE" ]

			then

			echo "Updating version name to $VERSION_NAME in AndroidManifest.xml"

			sed -i '' 's/versionName="[0-9.]*"/versionName="'$VERSION_NAME'"/' $ANDROID_BUILD_GRADLE

			echo "File content:"

			cat $ANDROID_BUILD_GRADLE
			fi




			#if [ -e "$INFO_PLIST_FILE" ]



#			then
#
#
#
#			echo "Updating version name to $VERSION_NAME in Info.plist"
#
#
#
#			plutil -replace CFBundleShortVersionString -string $VERSION_NAME $INFO_PLIST_FILE
#
#
#
#
#
#
#
#			echo "File content:"
#
#
#
#			cat $INFO_PLIST_FILE
#
#
#
#			fi